<script>
    import Byline from '../Byline/index.svelte';
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
        <img src="/streetscape/header.jpg">
    </div>
    <div class='entry-header'>
        <h1 class="entry-title entry-title--with-subtitle">So you live in a bad building</h1>
        <div class="newspack-post-subtitle">
            <p>There are 2,654 properties with a history of chronic, serious code violations in Chicago. Can their owners be forced to fix them? </p>
        </div>
        <Byline leadin="by" {authors} avatars={true}/>
    </div>
</div>
<style lang='scss'>
    .header-container {
    
        width: 100%;
        .entry-header {
            max-width:960px;
            width: 100%;
            margin: 0rem auto;
        }
        .newspack-post-subtitle {
            font-family: 'freight-text-pro', serif;
            line-height: 1.4;
            text-align: center;
            margin-top: 1rem;
            margin-bottom: 1.3em;
        }
        h1 {
            font-family: "meursault-variable", serif;
            font-variation-settings: "wght" 200, "wdth" 10;
            line-height: 1.2;
            text-align: center;
            margin: 0 0 0.5em;
        }
        .img-container {
            max-width: 1200px;
            width: 100%;
            margin: 0rem auto;
            position:relative;
            display: flex;
            justify-content: center;
            img {
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