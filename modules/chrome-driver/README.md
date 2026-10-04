# chrome-driver

`install.sh` installs Google Chrome, ChromeDriver and Selenium standalone 3.4.0 into `/usr/local/bin` (uses sudo). **Legacy**: the old `chromedriver.storage.googleapis.com` endpoint is deprecated, so the script likely fails on current Chrome; prefer Chrome for Testing (https://googlechromelabs.github.io/chrome-for-testing/).

```bash
bash ~/install/dotfiles/modules/chrome-driver/install.sh
chromedriver --version
```
