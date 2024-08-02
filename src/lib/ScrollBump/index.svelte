<script>
    import { marked } from 'marked';
    export let block;

    function scrollIntoView() {
		const el = document.querySelector('#options');
		if (!el) return;
        el.scrollIntoView({
            behavior: 'smooth'
        });
    }

    function addScrollEvent (el) {
        const link = el.querySelector('.click-here');
        link.addEventListener('click', scrollIntoView)
    }
</script>
<div class="pad">
    <div class="scroll-bump" use:addScrollEvent>
        {@html marked(block.Text)}
    </div>
</div>
<style lang='scss'>
    .scroll-bump {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
        background-color: rgba(35, 37, 41, 0.6);
        color: #eaeaea;
        border: 2px solid #232529;
    }
    :global(.scroll-bump p) {
        font-family: 'Sofia Pro', sans-serif;
        font-size: 0.9rem;
        padding: 0.5rem 2.5rem 0.5rem 1.5rem;
        line-height: 1.5;
    }
    :global(span.click-here) {
        text-decoration:underline;
        font-weight: 800;
        cursor: pointer;
    }
</style>