<script>
    export let authors;
    export let leadin;
    export let avatars = false;
    export let published;
</script>

<div class="entry-meta">
    {#if avatars}
        {#each authors as author}
            <span class="avatar">
                {#if author.src && author.src !== ''}
                    <img src={author.src} alt="Avatar photo of {author.name}" class="avi"/>
                {:else}
                    <span class="avi-placeholder"></span>
                {/if}
            </span>
        {/each}
    {/if}
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
<p class="publish-date entry-meta">{published}</p>

<style lang="scss">
    .entry-meta {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        font-family: 'Sofia Pro', sans-serif;
        font-size: 0.8rem;
        justify-content: center;
    }
    .publish-date {
        @media screen and (min-width: 730px) {
            margin-top: -10px;
        }
        
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
            z-index: 1;
        }
        .avi {
            z-index: 2;
        }
    }
    .byline {
        text-align: center;
        margin-bottom:0.5rem;
        a {
            text-decoration: none;
            color: #fff;
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