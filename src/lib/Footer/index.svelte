<script>
    import { marked } from 'marked';
    import DonateButton from '../DonateButton/index.svelte';
    
    export let Page;

</script>

<footer class="site-footer has-margin-top-40 full-width">
    <div class="container">
      <div class="site-footer__inner wide-well">
        <div class="textwidget site-footer__donatebox" >
          <div style='border-bottom: "1px solid #fff"'>
            <h3 class="title is-5 has-margin-bottom-10" style='color: "#fff";'>Donate</h3>
          </div>
          <div style='margin-top: 20px'><p>{Page.Footer.nonprofit}</p></div>
          <div class="donate-wrapper">
                <DonateButton />
            </div>
        </div>
        <div class="creditsbox">
          <div style="margin-top: 20">
            {@html marked(Page.Footer.credits)}
          </div>
        </div>
      </div>
      <div class="wide-well">
        <p>{Page.Footer.copyright}</p>
      </div>
    </div>
  </footer>
  <style lang='scss'>
    $tablet: 700px;
    .site-footer {
        background-color: #3d3741;
        padding: 30px 20px 40px;
        color: white;
        font-size: .8rem;
        line-height: 1.2rem;
        font-family: 'Sofia Pro', sans-serif;
        margin-bottom: -30px;

        

        &__donatebox {
            @media screen and (max-width: $tablet) {
            margin-top: 30px;
            }
        }

        .donate-wrapper {
            margin-top: 30px;
        }
    .container {
        width: 100%;
    }
    .site-footer__inner {
        
        display: flex;
        justify-content: space-between;

        & > * {
        width: 40%;
        }

        @media screen and (max-width: $tablet) {
        flex-direction: column;

        & > * {
            width: 100%;
        }
        }
    }
    .site-footer__donatebox {
        width: 100%;
        max-width: 384px;
        padding: 5px;
    }

    h3.title {
        font-family: 'Meursault', serif;
        font-weight: 600;
        font-size: 1.25rem;
        text-align: left;
    }
    .creditsbox {
        max-width: 384px;
        width: 100%;
        margin-top: 30px;
    }
    .wide-well {
        max-width: 1000px;
        width: 100%;
        margin: 0rem auto;
    }
}

:global(.creditsbox p strong) {
    color: #F0BA51;
}
:global(.creditsbox p) {
    margin: 0 0 0.25rem;
}
</style>