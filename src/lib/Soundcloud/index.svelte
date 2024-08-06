<script>
    export let block;
    let URL = block.URL;
    console.log(URL);
</script>
<div class="soundcloud-container">
    <iframe width="100%" height="200" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url={URL}&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
    <div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/injusticewatch" title="Injustice Watch" target="_blank" style="color: #cccccc; text-decoration: none;">Injustice Watch</a> · <a href="{URL}" title="End Of Eulogy by Tommie Davis" target="_blank" style="color: #cccccc; text-decoration: none;">End Of Eulogy by Tommie Davis</a></div>
</div>

<style lang='scss'>
    .soundcloud-container {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
        padding-left:10px;
        padding-right: 10px;
        box-sizing: border-box;
    }
</style>