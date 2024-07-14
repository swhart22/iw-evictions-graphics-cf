<script>
    import SocialWidgets from '../SocialWidgets/index.svelte';
    import SubscribeButton from '../SubscribeButton/index.svelte';
</script>
<nav
      class="navbar is-fixed-top"
      role="navigation"
      aria-label={"Aria label here"}
    >
      <div class="navbar-brand">
        <a
          class="navbar-item"
          href="https://www.injusticewatch.org/"
          aria-label={"Aria label here"}
        >
          <img
            src="./images/iw_logo.svg"
            style='height: 38px;'
            alt={"Aria label here"}
          />
        </a>
      </div>
      <div class="navbar-menu navbar-end">
        <SubscribeButton />
        <SocialWidgets
          className="navbar-item"
          style={{ paddingTop: 0, paddingBottom: 0 }}
          size={30}
        />
      </div>
    </nav>

    <style lang='scss'>
        $tablet: 700px;
        
        $iw-orange: #EA6D59;
        $font-sofia-pro: "Sofia Pro", "Open Sans", sans-serif;
        .navbar {
            background: #F6F4EB;
            -moz-background-size: 100% 100%;
            -o-background-size: 100% 100%;
            -webkit-background-size: 100% 100%;
            background-size: 100% auto;
            min-height: 4rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

.navbar-item {
  padding: 0.5rem 2rem;
  
  @media screen and (max-width: 500px) {
    padding: 0.5rem 0.75rem;
  }
}

@media screen and (min-width: $tablet) {
  .navbar {
    background: #F6F4EB;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    -webkit-background-size: 100% 100%;
    background-size: 100% auto;
  }
  
  .navbar-items {
    max-width: 945px;
  }
}

.navbar-menu {
  align-items: center !important;
}
.navbar-end {
    display: flex;
}
.lang-button, .donate-button {
  background-color: $iw-orange;
  padding: 0.7rem;
  font-family: $font-sofia-pro;
  border: 0;
  color: #fff;
  font-size: 0.8rem;
  font-weight: 900;
  padding: 0.7em 2em 0.6em;
  text-transform: none;
  
  @media screen and (max-width: 500px) {
    width: 50px;
  }
}
    </style>