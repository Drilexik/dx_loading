let debug = false;

window.addEventListener('message', function (event) {
    if (event.data.type === "SET_DEBUG") {
        debug = event.data.value;
    }

    if (event.data.type === "SHUTDOWN_LOADING") {
        if (debug) {
            console.log("Shutting down loading screen (via NUI message)...");
        }

        document.body.style.transition = 'opacity 1s ease-out';
        document.body.style.opacity = '0';

        setTimeout(() => {
            document.body.style.display = 'none';
            const music = document.getElementById('bg-music');
            if (music) music.pause();
        }, 1000);
    }
});