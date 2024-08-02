<script>
    import { assets } from '$app/paths';
    
    import Byline from '../Byline/index.svelte';

    export let Page;
    const authors = [
        {'name': 'Alejandra Cancino', 
            'src': 'https://www.injusticewatch.org/wp-content/uploads/cropped-cropped-Alejandra-scaled-1-80x80.jpg',
            'authorUrl':'https://www.injusticewatch.org/author/acancino/'
        },
        {'name': 'Maya Dukmasova', 
            'src': 'https://www.injusticewatch.org/wp-content/uploads/cropped-IMG_3758-scaled-1-80x80.jpg',
            'authorUrl':'https://www.injusticewatch.org/author/mdukmasova/'
        },
            
        {'name': 'Forest Gregg', 
            'src': 'https://secure.gravatar.com/avatar/?s=80&d=mm&r=g',
            'authorUrl':''
        },
            
        {'name': 'Alex Richards', 
            'src': 'https://secure.gravatar.com/avatar/?s=80&d=mm&r=g',
            'authorUrl':''
        }
    ];

    const contributingReporters = [
        {'name': 'Grace Asiegbu'},
        {'name': 'Eva Putnam'}
    ]
</script>
<div class="header-container">
    <div class="img-container">
        <img src='{assets}/streetscape/header.jpg'>
    </div>
    <div class='entry-header pad'>
        <p class="project-title">The Tenant Trap</p>
        <div class="break yellow"></div>
        <h1 class="entry-title entry-title--with-subtitle">{Page.headline}</h1>
        <div class="newspack-post-subtitle">
            <p>{Page.subhed}</p>
        </div>
        <Byline leadin="by" authors={Page.byline} avatars={true} published={Page.published}/>
    </div>
</div>
<style lang='scss'>
    .header-container {
        width: 100%;
        margin-bottom: 3rem;
        .entry-header {
            max-width:960px;
            width: 100%;
            margin: 0rem auto;
            // margin-top: -200px;
            z-index: 2;
        }
        .newspack-post-subtitle {
            font-family: 'Freight Text Pro', serif;
            line-height: 1.4;
            text-align: center;
            margin-top: 1rem;
            margin-bottom: 1.3em;
        }
        .project-title {
            text-transform: uppercase;
            color: rgb(248, 205, 101);
            letter-spacing: 0.2em;
            font-size: 0.7rem;
            font-family: 'Sofia Pro', sans-serif;
            text-align: center;
            font-weight: 900;
            // margin-bottom: 0.5rem;
        }
        .break.yellow {
            max-width: 100px;
            border-top: 2px solid rgb(248, 205, 101);
            height: 2px;
            margin: 0rem auto 1rem;
        }
        h1 {
            font-family: "Meursault Condensed", serif;
            line-height: 1.2;
            text-align: center;
            margin: 0 0 0.5em;
        }
        .img-container {
            // max-width: 1200px;
            width: 100%;
            margin: 0rem auto;
            position:relative;
            display: flex;
            justify-content: center;
            overflow-x: hidden;
            // z-index: 1;
            img {
                width:100%;
                // margin: 0rem auto;
                // width: 100%;
            }
            // max-height: 500px;
        }
        // max-height: 100vh;
        .header-img{
            // background-image: url('/static/streetscape/header.jpg');
            background-size:cover;
        }
    }
    @media only screen and (max-width: 600px) {
        h1{
            font-size: 44px;
        }
        .newspack-post-subtitle {
            font-size: 19.8px;
        }
    }
    @media only screen and (min-width: 600px) {
        h1 {
            font-size: 44px;
        }
        .newspack-post-subtitle {
            margin-bottom: 2.3em;
            font-size: 22px;
        }
    }
    @media only screen and (min-width: 782px) {
        h1 {
            font-size: 58px;
        }
        .newspack-post-subtitle {
            margin-bottom: 2.3em;
            font-size: 22px;
        }
    }
    @media only screen and (min-width: 1168px) {
        h1 {
            font-size: 64px;
        }
        .newspack-post-subtitle {
            margin-bottom: 2.3em;
            font-size: 22px;
        }
    }
    
    
</style>