<script>
    import LinkoutSVG from './linkout.svelte';
    import { onMount } from 'svelte';
    import Fa from 'svelte-fa';
    import { faPhone, faMoneyBill1, faGavel, faArrowRightLong, faArrowLeftLong, faCity } from '@fortawesome/free-solid-svg-icons'
    export let block;

    // console.log(block);

    const breakpoint = 800;
    let w, layers, hovers, smallLink;
    let activeIndex = 0;
    let hoverEls = 3;


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
        return -elX + (w / 2) - (elW / 2);
    }

   
    $: activeBuildingFromIndex(activeIndex);

    $: if (overflow) {
        // fires only if we enter smaller size from larger size
        activeBuildingFromIndex(0);
    }

    $: if (w >= breakpoint) {
        activeBuildingFromIndex(0);
    }

   
    onMount(() => {
        
        const withholdRent = document.querySelector('#withhold-rent polygon');
        const callTheCity = document.querySelector('#call-the-city polygon');
        const sueTheLandlord = document.querySelector('#sue-the-landlord polygon');
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
            }
        ];

        function hover (el) {

            hovers.forEach((h) => {
                h.el.classList.remove('active');
            })
            const text = document.querySelector(`.building-label.${el.slug}`);
            el.el.classList.add('active');
            text.classList.add('text-active');
        }
        function mouseout (el) {
            hovers.forEach((h) => {
                h.el.classList.add('active');
            })
        }

        // add links 
        hovers.forEach(el => {
            // add event listeners
            el.el.classList.add('active');
            // el.el.addEventListener('mouseover', () => hover(el));
            // el.el.addEventListener('mouseout', () => mouseout(el));
            el.el.addEventListener('click', () => link(el));
            el.el.setAttribute('tabindex', '0');
        });

        if (w < breakpoint) {
            activeBuildingFromIndex(0);
        }
        
    });
    function link (el) {
        const linkout = block.Links[el.slug] || 'https://injusticewatch.org';
        window.location.assign(linkout);
    }
    
    
</script>

<section class="linkout-container" id="options" bind:clientWidth={w} class:overflow={w < breakpoint} class:fullwidth={w >= breakpoint}>
    <div class="chatter">
        <h3>Courses of action:</h3>
        <p class="call-to-action">Click or tap a building to explore a particular option.</p>
    </div>
    <div class="controls">
        <div class="left" 
            on:click={() => cycle('left')} 
            on:keypress={() => cycle('left')}
            role="button" 
            tabindex="0" 
            class:display={activeIndex > 0}>
            <Fa icon={faArrowLeftLong} />
            {#if hovers && activeIndex > 0}
                <p>{hovers[activeIndex - 1].title}</p>
            {/if}
        </div>
        <div 
            class="right" 
            on:click={() => cycle('right')}
            on:keypress={() => cycle('right')}
            role="button" 
            tabindex="0" 
            class:display={activeIndex < hoverEls - 1}>
            <Fa icon={faArrowRightLong} />
            {#if hovers && activeIndex < hoverEls - 1}
                <p>{hovers[activeIndex + 1].title}</p>
            {/if}
        </div>
    </div>
    <div class="linkout-layers" bind:this={layers} >
        <img src="/streetscape/linkout.jpg">
        <LinkoutSVG />
        <div class="labels">
            <div class="building-label withhold-rent">
                
                
                <h4>
                <div class="number"><Fa icon={faMoneyBill1} color="#eaeaea" /></div> Withhold rent
                </h4>
                <p>One short sentence here leading into withhold rent story.
                </p>
            </div>
            <div class="building-label call-the-city">
               
                <h4>
                    <div class="number"><Fa icon={faPhone} color="#eaeaea" /></div> Call the city
                </h4>
                <p>One short sentence here leading into withhold rent story.
                </p>
            </div>
            <div class="building-label sue-the-landlord">
                
                
                <h4>
                    <div class="number"><Fa icon={faGavel} color="#eaeaea" /></div> Sue the landlord
                </h4>
                <p>One short sentence here leading into withhold rent story.
                </p>
            </div>
            <div class="building-label solutions">
                
                <h4>
                    <div class="number"><Fa icon={faCity} color="#eaeaea" /></div> Solutions
                </h4>
                <p>One short sentence here leading into withhold rent story.
                </p>
            </div>
        </div>
        
    </div>  
    <a class="small-link" bind:this={smallLink}></a>
    
</section>

<style lang='scss'>
    $iw-orange: #EA6D59;
    $shadow: #544D6F;
    .linkout-container {
        // max-width: 1100px;
        margin: 1rem 0rem auto;
        margin-bottom: -10px !important;
        .leadin {
            font-family: 'Sofia Pro', sans-serif;
        }
        .chatter {
            // position: absolute;
            // top: 0px;
            // left: 0px;
            max-width: 760px;
            margin: 1rem auto;
            h3 {
                font-family: "Meursault", serif;
                // font-size: 3rem;
                margin: 0;
                line-height: 3rem;
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
        .labels {
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            .building-label {
                position: absolute;
                // text-align:center;
                top: 0px;
                left:0px;
                max-width: 280px;
                p, h4 {
                    text-shadow: 1px 1px 2px $shadow,
                    -1px 1px 2px $shadow,
                    1px -1px 2px $shadow,
                    -1px -1px 2px $shadow;
                   
                }
                h4 {
                    font-size: 1.4rem;
                    font-family: "Meursault", serif;
                    // text-transform: uppercase;
                    // letter-spacing: 1px;
                    margin: 0;
                    line-height: 1.2;
                    color: #fff;
                }
                
                p {
                    font-family: 'Sofia Pro', sans-serif;
                    // text-transform: uppercase;
                    font-size: 0.7rem;
                    font-weight: 300;
                    margin: 0.25rem 0rem;
                    color: #fff;
                    
                }
                padding: 0px 5px 1px;
                border-radius: 2px;
                             // border: 2px solid #3d3741;
                // background-color: rgba(61, 55, 65, .4);
                // padding: 1rem 0.5rem 0.5rem;

               
                // border: 1px solid #999;
                &.withhold-rent {
                    top: 29%;
                    left: 1%;
                    // background-color: #ffc9fd;
                }
                &.call-the-city {
                    top: 29%;
                    left: 20%;
                }
                &.sue-the-landlord {
                    top: 17%;
                    left: 42%;
                }
                &.solutions {
                    top: 33%;
                    left: 73%;
                }
            }
        }
    }
    }
    .number {
        width: 40px;
        height: 40px;
        display: inline-flex;
        justify-content: center;
        align-items:center;
        color: #fff;
        border: 1px solid #fff;
        font-size: 1rem;
        border-radius: 50%;
        background-color: $iw-orange;
        margin-top: -20px;
        margin-right: 5px;
        font-weight: 800;
        // box-shadow: 1px 1px 2px #fff,
        // -1px 1px 2px #fff,
        // 1px -1px 2px #fff,
        // -1px -1px 2px #fff;
    }

    .linkout-container .small-link {
        width: 100vw;
        max-width: 500px;
        height: 411px;
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
                flex-direction: column;
                flex-wrap: wrap;
                // align-items: flex-start;
                cursor: pointer;

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
                align-items: flex-start;
            }
            .right {
                align-items: flex-end;
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


  
    :global(.linkout-container svg:not(.svelte-fa)) {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
        
    }
    :global(.linkout-container polygon) {
        fill: #fff;
        stroke: none;
        
        opacity: 0.3;
        
    }
    :global(polygon.active) {
            opacity: 0;
            cursor: pointer;
    }
    :global(.text-active) {
        color: #000 !important;
    }
</style>