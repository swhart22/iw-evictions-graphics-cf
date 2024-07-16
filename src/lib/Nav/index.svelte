<script>
    import SocialWidgets from '../SocialWidgets/index.svelte';
    import DonateButton from '../DonateButton/index.svelte';
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
            
            alt={"Aria label here"}
            class="custom-logo"
          />
        </a>
        <p class="site-identity">Nonprofit newsroom investigating the Cook County court system

        </p>
      </div>
      <div class="navbar-menu navbar-end">
        <DonateButton />
        <SocialWidgets
          className="navbar-item"
          style={{ paddingTop: 0, paddingBottom: 0 }}
          size={30}
        />
      </div>
    </nav>

    <style lang='scss'>
        $tablet: 785px;
        
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
            justify-content: space-around;
            padding-bottom: 25px;
            padding-top: 25px;
            @media screen and (max-width: 800px) {
                padding-top: 0px;
                padding-bottom: 0px;

            }
            @media screen and (max-width: $tablet) {
                justify-content: space-between;
                padding-left: 20px;
                padding-right: 20px;
            }
        }

.navbar-item {
//   padding: 0.5rem 2rem;
  
  @media screen and (max-width: 500px) {
    // padding: 0.5rem 0.75rem;
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
.navbar-brand {
    flex-basis: 40%;
    
}
.custom-logo {
    // height: 70px;
    // max-height: 192px;
    // max-width: 600px;
    width: 429px;
    @media screen and (max-width: $tablet) {
        width: 175px;
        margin-top: 5px;
    }
}
.site-identity {
    font-family: 'Sofia Pro', sans-serif;
    font-size: 0.75rem;
    color: #82766E;
    margin: 0;
    @media screen and (max-width: $tablet) {
        display: none;
    }
}


    </style>