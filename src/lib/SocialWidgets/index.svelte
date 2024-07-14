<script>
    export let style;
    export let size;
    const color = '#000';
    const facebookurl = '';
    const handleFacebookClick = () => {};
    const twitterurl = '';
    const handleTwitterClick = () => {};

</script>

<div class="widgets-container">
<div class="social-widgets__iconbox">
    <a
      href={facebookurl}
      onClick={handleFacebookClick}
      target="_blank"
      aria-label="social.facebookshare.aria"
    >
      <svg
        width={size + "px"}
        viewBox="0 0 32 32"
        style={{ display: "block" }}
      >
        <g>
          <path
            class="social-widgets__icon facebook"
            style={{
              fill: color
            }}
            d="M17,11.5c0-0.3,0.2-0.5,0.5-0.5h2V8H16c-1.4,0-2.5,1.1-2.5,2.5v3H12v3h1.5V24H17v-7.5h2l0.5-3H17V11.5z"
          />
        </g>
      </svg>
    </a>
  </div>
  <div class="social-widgets__iconbox">
    <a
      href={twitterurl}
      onClick={handleTwitterClick}
      target="_blank"
      aria-label="social.twittershare.aria"
    >
      <svg
        width={size + "px"}
        viewBox="3 3.4 26 26"
        style={{ display: "block" }}
      >
        <g>
          <path
            class="social-widgets__icon twitter"
            style={{
              fill: color
            }}
            d="M22.1,12.1c0.7-0.4,1.2-1.1,1.4-1.8c-0.6,0.4-1.3,0.6-2.1,0.8c-0.6-0.6-1.5-1-2.4-1c-1.8,0-3.3,1.5-3.3,3.3c0,0.3,0,0.5,0.1,0.7c-2.7-0.1-5.2-1.4-6.8-3.4c-0.3,0.5-0.4,1.1-0.4,1.7        c0,1.1,0.6,2.1,1.5,2.7c-0.5,0-1-0.2-1.5-0.4v0c0,1.6,1.1,2.9,2.6,3.2C11,17.9,10.7,18,10.4,18c-0.2,0-0.4,0-0.6-0.1        c0.4,1.3,1.6,2.3,3.1,2.3c-1.1,0.9-2.5,1.4-4.1,1.4c-0.3,0-0.5,0-0.8,0c1.4,0.9,3,1.4,4.7,1.5h0.8c5.7-0.3,8.9-5.1,8.9-9.3        c0-0.1,0-0.3,0-0.4c0.6-0.5,1.2-1,1.6-1.7v0C23.4,11.8,22.8,12,22.1,12.1z"
          />
        </g>
      </svg>
    </a>
  </div>

</div>
<style lang='scss'>
    .widgets-container {
        display: flex;
    }
</style>