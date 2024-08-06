<script>
    import { marked } from 'marked';
    export let block;
</script>

<figure class="body-image-double" class:lead={block.Id === 'lead'}>
    <div class="side-by-side">
        <img src="{block.Src[0]}" alt="{block.AltText}" />
        <img src="{block.Src[1]}" alt="{block.AltText}" />
    </div>
    {#if block.Caption !== ''}
        <figcaption class="caption">{@html marked.parseInline(block.Caption)}</figcaption>
    {/if}
</figure>
<style lang='scss'>
.body-image-double {
    max-width: 1400px;
    width: 100%;
    margin: 1rem auto;
    padding-left:10px;
    padding-right: 10px;
    box-sizing: border-box;
  
    img {
        width: 100%;
    }
}
.side-by-side {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 0rem auto;
    img {
        // min-width: 600px;
        width: 50%;
        padding: 0.5rem;
        &:first-child {
            padding-right: 0.25rem;
            padding-left: 0;
        }
        &:last-child {
            padding-left: 0.25rem;
            padding-right: 0;
        }
        @media screen and (max-width: 600px) {
            width: 100%;
            &:first-child {
                padding-right: 0;
            }
            &:last-child {
                padding-left: 0;
            }
        }
    }
}
.caption {
    font-family: 'Sofia Pro', sans-serif;
    font-size: 0.75rem;
    line-height: 1.4;
    margin-top: 0.5rem;
}
</style>