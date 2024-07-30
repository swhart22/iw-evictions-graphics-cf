<script>
    import { marked } from 'marked';
    export let block;
</script>

<figure class="body-image">
    <img src="{block.Src}" alt="{block.AltText}" />
    {#if block.Caption !== ''}
        <figcaption class="caption">{@html marked.parseInline(block.Caption)}</figcaption>
    {/if}
</figure>
<style lang='scss'>
.body-image {
    max-width: 780px;
    width: 100%;
    margin: 1rem auto;
    padding-left:10px;
    padding-right: 10px;
    box-sizing: border-box;
    img {
        width: 100%;
    }
}
.caption {
    font-family: 'Sofia Pro', sans-serif;
    font-size: 0.75rem;
    line-height: 1.4;
    margin-top: 0.5rem;
}
</style>