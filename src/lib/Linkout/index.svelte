<script>
    import LinkoutSVG from './linkout.svelte';
    import { onMount } from 'svelte';
    import { marked } from 'marked';
    import Fa from 'svelte-fa';
    import './svg.scss';
    import { faPhone, faMoneyBill1, faGavel, faCaretRight, faCaretLeft, faCity } from '@fortawesome/free-solid-svg-icons'
    import { assets } from '$app/paths';
    export let block;
    export let story;
    export let embed;

    // console.log(block);

    const breakpoint = 800;
    let w, layers, hovers, smallLink;
    let activeIndex = 0;
    let hoverEls;


    $: overflow = w < breakpoint; 

    function cycle (dir) {
        if (layers && w < breakpoint) {
            if (dir === 'left') {
                if (activeIndex === 0) {
                    activeIndex = hoverEls - 1;
                } else {
                    activeIndex -= 1;
                }
                
            } else {
                const newInt = activeIndex + 1;
                activeIndex = newInt % hoverEls;
            }
        }
    }

    function activeBuildingFromIndex (index) {
        if (layers && w < breakpoint) {
            
            const activeEl = hovers[index];
            
            layers.style.transform = `translateX(${transformLayers(activeEl)}px)`;
            const labels = document.querySelectorAll('.building-label');
            labels.forEach((el, i) => {
                const classes = Array.from(el.classList);
                if (classes.includes(activeEl.slug)) {
                        el.style.display = 'block';
                } else {
                        el.style.display = 'none';
                }
            });
            smallLink.setAttribute('href', block.Links[activeEl.slug]);
            mouseout();
            hover(activeEl);
            
        } else if (layers && w >= breakpoint) {
            const labels = document.querySelectorAll('.building-label');
            labels.forEach(el => el.style.display = 'block');
            layers.style.transform = 'translateX(0px)';
        }
    }

    function transformLayers (el) {
        const elToCenter = el.el;
        const elCoords = elToCenter.getBoundingClientRect();
        const elW = elCoords.width;
        const parent = layers;
        const parentCoords = parent.getBoundingClientRect();
        const elX = elCoords.x - parentCoords.x;
        const rawTransformX = -elX + (w / 2) - (elW / 2);
        
        if (rawTransformX > 0) {
            return 0;
        } else if (Math.abs(rawTransformX) > elW) {
            return -parentCoords.width + w;
        } else {
            return rawTransformX;
        }
    }

   
    $: activeBuildingFromIndex(activeIndex);

    $: if (overflow) {
        // fires only if we enter smaller size from larger size
        activeBuildingFromIndex(0);
    }

    $: if (w >= breakpoint) {
        activeBuildingFromIndex(0);
    }

    function hover (el) {
            const activeBldg = document.querySelector(`.img-layer.${el.slug}`);
            activeBldg.classList.add('active');
            
            const text = document.querySelector(`.building-label.${el.slug}`);
            text.classList.add('text-active');
        }
        function mouseout (el) {
            const bldgs = document.querySelectorAll('.img-layer');
            bldgs.forEach((h) => {
                h.classList.remove('active');
            });

            const texts = document.querySelectorAll('.building-label');
            texts.forEach(t => {
                t.classList.remove('text-active');
            });
        }
        onMount(() => {
        setTimeout(() => {
                activeBuildingFromIndex(0);
            }, 500)
        });
    $: if (layers) {
        
        const withholdRent = document.querySelector('#withhold-rent polygon');
        const callTheCity = document.querySelector('#call-the-city path');
        const sueTheLandlord = document.querySelector('#sue-the-landlord polygon');
        const solutions = document.querySelector('#solutions polygon');
        hovers = [
            {
                el: withholdRent,
                slug: 'withhold-rent',
                anchor: 310,
                title: 'Withhold rent'
            }, 
            {
                el: callTheCity,
                slug: 'call-the-city',
                anchor: 27,
                title: 'Call the city'
            }, 
            {
                el: sueTheLandlord,
                slug: 'sue-the-landlord',
                anchor: -80,
                title: 'Sue the landlord'
            },
            {
                el: solutions,
                slug: 'solutions',
                anchor: -200,
                title: 'Solutions'
            }
        ];

        hovers = hovers.filter(d => d.slug !== story);
        hoverEls = hovers.length;

        // add links 
        hovers.forEach(el => {
            // add event listeners
            el.el.addEventListener('mouseover', () => hover(el));
            el.el.addEventListener('mouseout', () => mouseout(el));
            el.el.addEventListener('click', () => link(el));
            el.el.setAttribute('tabindex', '0');

            // text event listeners
            const text = document.querySelector(`.building-label.${el.slug}`);
            text.addEventListener('mouseover', () => hover(el));
            text.addEventListener('mouseout', () => mouseout(el));
            text.addEventListener('click', () => link(el));
            
        });

    
        
    };
   
   
    function link (el) {
        const linkout = block.Links[el.slug] || 'https://injusticewatch.org';
       
        window.open(linkout, '_blank');
    }

   
    
    
</script>

<section class="linkout-container"  id="options" bind:clientWidth={w} class:overflow={w < breakpoint} class:fullwidth={w >= breakpoint}>
    <div class="chatter">
        <h3>{block.Title}</h3>
        <p class="call-to-action">{block.Dek}</p>
    </div>
    {#if w}
    <div class="controls">
        <div class="left" 
            on:click={() => cycle('left')} 
            on:keypress={() => cycle('left')}
            role="button" 
            tabindex="0" 
            class:display={activeIndex > 0}>
            <Fa icon={faCaretLeft} />
            {#if hovers && activeIndex > 0}
                <p class="prev-next prev">Prev</p>
                <!-- <p>{hovers[activeIndex - 1].title}</p> -->
            {/if}
        </div>
        <div 
            class="right" 
            on:click={() => cycle('right')}
            on:keypress={() => cycle('right')}
            role="button" 
            tabindex="0" 
            class:display={activeIndex < hoverEls - 1}>
            {#if hovers && activeIndex < hoverEls - 1}
                <p class="prev-next next">Next</p>
                <!-- <p>{hovers[activeIndex + 1].title}</p> -->
            {/if}
            <Fa icon={faCaretRight} />
            
        </div>
    </div>
    
    <div class="linkout-layers" bind:this={layers}>
        <img src="{assets}/streetscape/linkout.jpg">
        <img src="{assets}/streetscape/B1.png" class="img-layer withhold-rent">
        <img src="{assets}/streetscape/B2.png" class="img-layer call-the-city">
        <img src="{assets}/streetscape/B3.png" class="img-layer sue-the-landlord">
        <img src="{assets}/streetscape/B4.png" class="img-layer solutions">
        <LinkoutSVG />
        <div class="labels">
            <div class="building-label withhold-rent" class:small={w < breakpoint} class:embed class:hidden={story === 'withhold-rent'}>
                <h4><div class="number"><Fa icon={faMoneyBill1} color="#eaeaea" /></div> Withhold rent</h4>
                <div class="break"></div>
                <p>{@html marked.parseInline(block.Links['withhold-rent-dek'])} </p>
                <p class="read-more"><span class="text">Learn more</span><span class="arrow">→</span></p>
            </div>
            <div class="building-label call-the-city" class:small={w < breakpoint} class:embed class:hidden={story === 'call-the-city'}>
                <h4><div class="number"><Fa icon={faPhone} color="#eaeaea" /></div> Call the city</h4>
                <div class="break"></div>
                <p>{@html marked.parseInline(block.Links['call-the-city-dek'])} </p>
                <p class="read-more"><span class="text">Learn more</span><span class="arrow">→</span></p>
            </div>
            <div class="building-label sue-the-landlord" class:small={w < breakpoint} class:embed class:hidden={story === 'sue-the-landlord'}>
                <h4><div class="number"><Fa icon={faGavel} color="#eaeaea" /></div> Sue the landlord</h4>
                <div class="break"></div>
                <p>{@html marked.parseInline(block.Links['sue-the-landlord-dek'])} </p>
                <p class="read-more"><span class="text">Learn more</span><span class="arrow">→</span></p>
            </div>
            <div class="building-label solutions" class:small={w < breakpoint} class:embed class:hidden={story === 'solutions'}>
                <h4><div class="number"><Fa icon={faCity} color="#eaeaea" /></div> Solutions</h4>
                <div class="break"></div>
                <p>{@html marked.parseInline(block.Links['solutions-dek'])}</p>
                <p class="read-more"><span class="text">Learn more</span><span class="arrow">→</span></p>
            </div>
        </div>
        
    </div>  
    <a class="small-link" bind:this={smallLink}>
       
    </a>
    {/if}
    
</section>

<style lang='scss'>
    // @import 'svg.scss';
    $iw-orange: #EA6D59;
    $shadow: #544D6F;
    
    .linkout-container {
        min-height: 414px;
        // max-width: 1100px;
        margin: 5rem 0rem auto;
        margin-bottom: -10px !important;
        .leadin {
            font-family: 'Sofia Pro', sans-serif;
        }
        .chatter {
            max-width: 760px;
            margin: 1rem auto;
            h3 {
                font-family: "Meursault", serif;
                // font-size: 3rem;
                margin: 0;
                // line-height: 3rem;
                text-align: left;
            }
            p {
                font-family: 'Freight Text Pro', serif;
            }
            .call-to-action {
                font-family: 'Sofia Pro', sans-serif;
                margin: 0;
                font-size: 0.9rem;
                // font-style: italic;
            }
            @media screen and (max-width: 1100px) {
                padding-left: 5px;
                padding-right: 5px;
            }
        }
        .linkout-layers{
            position:relative;
            transition: transform 0.25s ease;
       
        img {
            width: 100%;
            // position: absolute;
            top: 0px;
            left: 0px;
            z-index: 1;
        }
        img.img-layer {
            position: absolute;
            pointer-events: none;
            &:not(.active) {
                opacity: 0;
            }
            &.active {
                opacity: 1;
            }
        }
        .labels {
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: 5;
            @media screen and (max-width: 800px) {
                    width: 100vw;
                    top: 10px !important;
                    // left: 50px !important;
                    // left: 0px !important;
                }
            .building-label {
                position: absolute;
                top: 0px;
                left:0px;
                max-width: 270px;
                cursor: pointer;
                p, h4 {
                    text-shadow: 1px 1px 2px $shadow,
                    -1px 1px 2px $shadow,
                    1px -1px 2px $shadow,
                    -1px -1px 2px $shadow;
                    color: #fff;
                }
                h4 {
                    font-size: 1.4rem;
                    font-family: "Meursault", serif;
                    margin: 0;
                    line-height: 1.2;
                }
                
                p {
                    font-family: 'Sofia Pro', sans-serif;
                    font-size: 0.8rem;
                    font-weight: 300;
                    margin: 0.25rem 0rem;
                    
                }
                padding: 0px 5px 1px;
                border-radius: 2px;
                &.small {
                    display: none;
                }
                
                &.text-active {
                    p, h4 {
                        color: #fff;
                    }
                }
                &.withhold-rent {
                    top: 15%;
                    left: 2%;
                }
                &.call-the-city {
                    top: 15%;
                    left: 25%;
                }
                &.sue-the-landlord {
                    top: 15%;
                    left: 48%;
                }
                &.solutions {
                    top: 15%;
                    left:auto;
                    right: 10%;
                }

                
                &.withhold-rent.small {
                    top:-10px;
                    left: 2%;
                }
                &.call-the-city.small {
                    top: -10px;
                    left: 19%;
                }
                &.sue-the-landlord.small {
                    top: -10px;
                    left: 40%;
                }
                &.solutions.small {
                    top: -10px;
                    left: auto;
                    right: 4%;
                }

                &.withhold-rent.small.embed {
                    top:10px;
                    left: 2%;
                }
                &.call-the-city.small.embed {
                    top: 10px;
                    left: 19%;
                }
                &.sue-the-landlord.small.embed {
                    top: 10px;
                    left: 40%;
                }
                &.solutions.small.embed {
                    top: 10px;
                    left: auto;
                    right: 4%;
                }
                

            }
        }
    }
    }
    .number {
        // width: 40px;
        // height: 40px;
        // display: inline-flex;
        display: none;
        justify-content: center;
        align-items:center;
        color: #fff;
        // border: 1px solid #fff;
        font-size: 1rem;
        border-radius: 50%;
        // background-color: $iw-orange;
        // margin-top: -20px;
        margin-right: 5px;
        font-weight: 800;
    }

    .linkout-container .small-link {
        width: 100vw;
        max-width: 500px;
        height: 250px;
        position: absolute;
        left: 0px;
        // background-color: red;
        bottom: 0px;
        // margin-top: 150px;
    }

    .linkout-container.fullwidth {
        width: 100%;
        .controls {
            display: none;
        }
        .linkout-layers {
            transform: translateX(0px);
        }
        .small-link {
            pointer-events: none;
        }
    }

    .linkout-container.overflow {
        width: 100vw;
        overflow-x: hidden;
        .small-link {
            pointer-events: all;
            cursor:pointer;
        }
        .controls {
            // position: absolute;
            display: flex;
            justify-content: space-between;
            width: 100vw;
            top: 0px;
            left: 0px;
            padding: 1rem 0.5rem;
            .left, .right {
                opacity: 0;
                pointer-events: none;
                display: flex;
                background-color: $iw-orange;
                // flex-direction: column;
                // flex-wrap: wrap;
                // align-items: flex-start;
                cursor: pointer;
                align-items: flex-end;
                padding: 0rem 0.5rem 0.25rem 0.5rem;
                p {
                    text-transform: uppercase;
                    font-family: 'Sofia Pro', sans-serif;
                    font-size: 0.75rem;
                    margin: 0.25rem 0 0 0;
                    
                }
                &.display {
                    opacity: 1;
                    pointer-events: all;
                }
            }
            .left {
                // align-items: flex-start;
            }
            .right {
                // align-items: flex-end;
            }
            .right p {
                text-align: right;
            }
        }
        .linkout-layers {
            width: 800px;
            // transform: translateX(-250px);
        }
    }
    .hidden {
        display: none !important;
    }
    .prev {
        margin-left: 5px !important;
    }
    .next {
        margin-right: 5px !important;
    }
    .read-more {
        span.text {
            font-weight: 800;
            margin-right: 0.2rem;
        }
        span.arrow {
            font-weight: 300;
        }
        white-space: nowrap;
        background-color: $iw-orange;
        padding: 0.1rem 0.6rem 0.15rem 0.3rem;
        border-radius: 2px;
        text-shadow:none!important;
        display: inline-flex;
        align-items: center;
       
    }

    .break {
        border-top: 2px solid $iw-orange;
        height: 1px;
        width: 150px;
        margin-top: 0.5rem;
    }

  
    :global(.linkout-container svg:not(.svelte-fa)) {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
    }
   
</style>