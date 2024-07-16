<script>
    import Fa from 'svelte-fa';
    import { faFacebookF } from '@fortawesome/free-brands-svg-icons'
    import { faXTwitter } from '@fortawesome/free-brands-svg-icons';
    export let style;
    export let size;
    const color = '#333';
    const facebookurl = '';
    const handleFacebookClick = () => {};
    const twitterurl = '';
    const handleTwitterClick = () => {};
    const scale = 1;

</script>

<div class="widgets-container">
<div class="social-widgets__iconbox">
    <a
      href={facebookurl}
      onClick={handleFacebookClick}
      target="_blank"
      aria-label="social.facebookshare.aria"
    >
      <Fa icon={faFacebookF} {color} {scale} />
    </a>
  </div>
  <div class="social-widgets__iconbox">
    <a
      href={twitterurl}
      onClick={handleTwitterClick}
      target="_blank"
      aria-label="social.twittershare.aria"
    >
        <Fa icon={faXTwitter} {color} {scale} />
    </a>
  </div>

</div>
<style lang='scss'>
    .widgets-container {
        display: none;
    }
    .social-widgets__iconbox {
        padding: 0px 10px;
        
    }
</style>