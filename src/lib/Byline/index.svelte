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
            <strong>
                {#if authors[0].authorUrl && authors[0].authorUrl !== ''}
                    <a href={authors[0].authorUrl}>{authors[0].name}</a>
                {:else}
                    {authors[0].name}
                {/if} 
            </strong>
        {:else}
            {#each authors as author, i}
                {#if i < authors.length - 2} 
                    {#if author.authorUrl && author.authorUrl !== ''}
                        <strong><a href={author.authorUrl}>{author.name}</a></strong>,&nbsp;
                    {:else}
                        <strong>{author.name}</strong>,&nbsp;
                    {/if}
                {:else if i === authors.length - 2}
                    {#if author.authorUrl && author.authorUrl !== ''}
                        <strong><a href={author.authorUrl}>{author.name}</a></strong> and&nbsp;
                    {:else}
                        <strong>{author.name}</strong> and&nbsp;
                    {/if}
                {:else if i === authors.length - 1}
                    {#if author.authorUrl && author.authorUrl !== ''}
                        <strong><a href={author.authorUrl}>{author.name}</a></strong>
                    {:else}
                        <strong>{author.name}</strong>
                    {/if}
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
        a {
            text-decoration: none;
            color: #333;
        }
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