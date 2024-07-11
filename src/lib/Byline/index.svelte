<script>
    export let authors;
    export let leadin;
</script>

<div class="entry-meta">
    {#each authors as author}
        <span class="avatar">
            {#if author.src && author.src !== ''}
                <img src={author.src} alt="Avatar photo of {author.name}"/>
            {:else}
                <span class="avi-placeholder"></span>
            {/if}
        </span>
    {/each}
    <span class="byline">
        {leadin}
        {#if authors.length === 1} 
            <strong>{authors[0].name}</strong>
        {:else}
            {#each authors as author, i}
                {#if i < authors.length - 2} 
                <strong>{author.name}</strong>,&nbsp;
                {:else if i === authors.length - 2}
                <strong>{author.name}</strong> and&nbsp;
                {:else if i === authors.length - 1}
                <strong>{author.name}</strong>
                {/if}
            {/each}
        {/if}
    </span>
</div>

<style lang="scss">
    .entry-meta {
        display: flex;
        flex-wrap: wrap;
        font-family: 'sofia-pro', sans-serif;
        font-size: 16px;
        justify-content: center;
    }
    .avatar {
        margin-right: 0.5rem;
        margin-bottom: 0.5rem;
        float:left;
        &:not(:first-child) {
            margin-left: -20px;
        }
        img {
            border-radius: 100%;
            width: 100%;
            height: 100%;
        }
        .avi-placeholder {
            border-radius: 100%;
            background-color: #eaeaea;
            display: inline-block;
            width: 100%;
            height: 100%;
        }
    }
    .byline {
        text-align: center;
    }
    @media only screen and (max-width: 600px) {
       .avatar {
         width: 1.75rem;
         height: 1.75rem;
       }
    }
    @media only screen and (min-width: 600px) {
        .avatar {
            width: 2rem;
            height: 2rem;
       }
    }
    @media only screen and (min-width: 782px) {
        .avatar {
            width: 2.25rem;
            height: 2.25rem;
       }
    }
    @media only screen and (min-width: 1168px) {
        .avatar {
            width: 2.25rem;
            height: 2.25rem;
       }
    }
</style>