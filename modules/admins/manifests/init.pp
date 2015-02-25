class admins (){

  ssh_authorized_key { 'nibz@maxwell':
    ensure => present,
    user   => 'pcci',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDW+WftKW0GvHKnIAZuE+WCcgLYzSj5LaJ1BEg1DXtBU8yKpTmdunjtJ47F0nVap/6nmbi3Xif4KHYEMoSkmyU+hqEbpFX/GzoJ0i69Kf+FYHfP5ZC8MD9NjdZ7pyPNIXvKTqRUc+ghDVwyDdtVOEiUtOTVrzDsKrDheZi9TvXTZ4fHj4ykuwDQeNwUoEBuhYZSg6/82+Bsqv/l5lOuZrOOOLikOK733KhBvXhEaeChxT2Tc0biaUuJFa7w+i/lc7uBuF3jY8H5cSd/FpKNgAMd4VaebX6m0WqYSWz+VlLARqyz8AP0jlK/2cHiB8Yu0zK34Q+os1tBzc6dc8jyxyjUA5ydDsUnRXaYlHAwsPGygb5EyCgll78EXR2MjSCWX6kfbG4NTM1T00Ezftld0jbcNG5t6skkYPnZQhTpesnauwc6Kj+ME+kftHpyd1HxWM24IeCRG0PznJuxNxBp8PlSMWDZtf1f5+ez7Z9rj0Qxi0Jd53EOMGSfYQUuMXRpnk7M/rX50J9wRts/+OnoH/4AxUAU5yB2ELzi6f4lt2Scqruj7Xp78SW++0nbdQQwYTqiNfLA789jIGaM2r1GAn06oX7jyEpniglaNf/9KGZVb+Y4WWLV4Wr8xfPrsQf1i5YK94qhN4C8NrXOG7hEcYT7Rvu2jKZ4dhwGxh4SmWNY0Q==',
  }

  ssh_authorized_key { 'krinkle@gir':
    ensure => present,
    user   => 'pcci',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDcHzySqYlH1TfAPx5PaVzqkuMbI3zksJ5E2aZBlsIN7wNSoyO0Dts6HegHZIgi5NGT05wRBAUMCNZwupqFoWDg41JBKzPKITkqvEe/FnNmJFxt591ltXigZZ+ZLoX8B12nww/eeA5nx9PT4hIsLQG50MxEm0iC4ApusaAXMXa7+gTDkzf6yyl4QwinyFFTYtyJwFw5XfQXXRQwL8Qv6mVGrhDz3Fj4VWawByQuxRHgt5G3Ux/PnZzatJ3tuSK66o1uXrvuOiGdUtDCuAFUx+kgcmUTpCC6vgMZdDbrfyw0CGxkmAUNfeEMOw0TWbdioJ2FwH5+4BEvMgiFgsCTjIwDqqyFV9eK8sd0mbJ+I82EyOXPlFPKGan6Ie6LD1qotdUW9vT3pfpR/44s/Id2un3FBnVg7GZkGJshikGO1UqjmZfhEpQ6Q+auLir+mBv2X/ril6qJ2NuQpwMRVzZmriPMxdJDs6xhzg2fGEYRvEvh0kzsqNf4OgKbSWiVOB3WALM30Cx3YdmnB6JonRGA+6CqD+LO4HQMbD7LBVcYzEIS1WtP8aPx/NiybemrF0LWmIgl34A0Tpcc+5MLzzUtgUt6lYFyWxltCP43u1N7ODH+FsFALzo6CO9DjyMxEd6Ay61hyx8Btfhn8NH/wEdCQj1WAMHU+d2ljk5ndAfp8c6LRQ==',
  }

}
