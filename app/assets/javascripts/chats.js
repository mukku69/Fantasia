// チャット　最下部にスクロール
document.addEventListener("turbolinks:load", () => {
    function scrollToEnd() {
        if(document.URL.match(/room\/+\d/)){
        const messageDetails = document.getElementById('scroll');
        messageDetails.scrollTop = messageDetails.scrollHeight;
        }
    }
    scrollToEnd()
})