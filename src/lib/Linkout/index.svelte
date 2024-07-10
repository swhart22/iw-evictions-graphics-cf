<script>
    import LinkoutSVG from './linkout.svelte';
    import { onMount } from 'svelte';

    onMount(() => {
        const withholdRent = document.querySelector('#withhold-rent polygon');
        const callTheCity = document.querySelector('#call-the-city polygon');
        const sueTheLandlord = document.querySelector('#sue-the-landlord polygon');
        const hovers = [
            {
                el: withholdRent,
                slug: 'withhold-rent'
            }, 
            {
                el: callTheCity,
                slug: 'call-the-city'
            }, 
            {
                el: sueTheLandlord,
                slug: 'sue-the-landlord'
            }
        ];

        function hover (el) {
            const text = document.querySelector(`.building-label.${el.slug}`);
            el.el.classList.add('active');
            text.classList.add('text-active');
        }
        function mouseout (el) {
            const text = document.querySelector(`.building-label.${el.slug}`);
            el.el.classList.remove('active');
            text.classList.remove('text-active');
        }

        // add links 
        hovers.forEach(el => {
            // wrap each polygon in link
            // moveToLink(el.el, `https://google.com`);

            // add event listeners
            el.el.addEventListener('mouseover', () => hover(el));
            el.el.addEventListener('mouseout', () => mouseout(el));
            el.el.addEventListener('click', () => link(el));
        });
        
    });
    function link (el) {
        window.location.assign(`https://google.com`);
    }
    function moveToLink(el, href){
        
        var link = document.createElement('a');
        link.innerHTML = el.outerHTML;
        link.setAttribute('xlink:href', href);
        
        el.parentNode.insertBefore(link, el);
        el.remove();
    }
    
</script>

<div class="linkout-container">
    <!-- <div class="leadin">
        <p>As a tenant in a building with chronic code violations, you have</p>
    </div> -->
    <div class="linkout-layers">
        <img src="/streetscape/linkout.jpg">
        <LinkoutSVG />
        <div class="labels">
            <div class="chatter">
                <h3>Three courses of action:</h3>
                <p class="call-to-action">Click or tap a building to explore a particular option.</p>
            </div>
            <div class="building-label withhold-rent">Withhold rent</div>
            <div class="building-label call-the-city">Call the city</div>
            <div class="building-label sue-the-landlord">Sue the landlord</div>
        </div>
    </div>  
</div>

<style lang='scss'>
    .linkout-container {
        width: 100%;
        max-width: 1100px;
        margin: 1rem auto;
        .leadin {
            font-family: 'sofia-pro', sans-serif;
        }
        .chatter {
            position: absolute;
            top: 0px;
            left: 0px;
            h3 {
                font-size: 3rem;
                margin: 0;
                line-height: 3rem;
            }
            p {
                font-family: 'freight-text-pro', serif;
            }
            .call-to-action {
                font-family: 'sofia-pro', sans-serif;
                font-style: italic;
            }
        }
        .linkout-layers{
            position:relative;
       
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
                text-align:center;
                top: 0px;
                left:0px;
                font-size: 16px;
                font-family: 'sofia-pro', sans-serif;
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 1px;
                
                padding: 0px 5px 1px;
                border-radius: 2px;
                color: #525252;

               
                // border: 1px solid #999;
                &.withhold-rent {
                    top: 29%;
                    left: 10%;
                    // background-color: #ffc9fd;
                }
                &.call-the-city {
                    top: 46%;
                    left: 31%;
                }
                &.sue-the-landlord {
                    top: 10%;
                    left: 65%;
                }
            }
        }
    }
    }
    :global(.linkout-container svg) {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 2;
    }
    :global(.linkout-container polygon) {
        fill: #fff;
        stroke: none;
        opacity: 0;
        
    }
    :global(polygon.active) {
            opacity: 0.3;
            cursor: pointer;
    }
    :global(.text-active) {
        color: #000 !important;
    }
</style>