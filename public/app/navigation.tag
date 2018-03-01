<navigation>
  <nav class="h-nav">
      <a class="navigation-title" href="https://jsfight.club/"><h1 class="title">JavaScript Fight Club</h1></a>
      <ul class="navigation-list float-right">
          <li class="navigation-item"><a class="navigation-link">Battle</a></li>
          <li class="navigation-item"><a class="navigation-link">Leaderboard</a></li>
          <li class="navigation-item"><a class="navigation-link">How to Play</a></li>
          <li class="navigation-item" if={ !loggedIn }><a class="navigation-link" href="/auth/github">Log in with GitHub</a></li>
          <virtual if={ loggedIn }>
            <li class="navigation-item"><a class="navigation-link" href="/account">{ username }</a></li>
            <li class="navigation-item"><a class="navigation-link" href="/logout">Log out</a></li>
          </virtual>
          <li class="navigation-item"><a class="navigation-link">About</a></li>
      </ul>
  </nav>
  <script>
    let tag = this;

    tag.on('before-mount', function (e) {
      $.getJSON('/api/user', function (data) {
        tag.loggedIn = !!data.github_id;
        tag.username = data.github_login;
        tag.update();
      });
    });
  </script>
</navigation>