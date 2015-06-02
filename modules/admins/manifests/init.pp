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

  ssh_authorized_key { 'daenney@puppet-community':
    ensure => present,
    user   => 'pcci',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAAEAQC6avnfF/hR7RgR9hPljFtNMMJoaVdIzYhNCPR90Cj2jxQ19AYAgy7dqQF0lJ4+XmcqOjpwfqrGUxr8KmuxvKx2KHYgmgK+SOiMJn4he8c7bSDU3WEPvh5uWPb8GIoyuVnYjrCSKEWyb5qx1CauUyNPwDcuOwDRIXFNMDi2rOZRw/RqrJVhzGZita0FeH72lDy3LfkNHc++N1wpypPL0GRiUCVaZQ5zL0nLcbTh7jv7znjJB2tCdQFNADHLiBBqR6AH6rnvayOZQzXafNzfyk9bzA1tlYDFx/c2N/wQ0lfmAZRn3+qHURdY63I6rY6txWuqmzTWjNdAbSvdLRKSJsBUQ5yALqe8IvLsAmxQIi+YWG9W/lgddsfNarXo+5jiG+B7+u0fDOEzNtzEaCur4to8Z2OfFEYh6brieG9rhbSv7F+pN229f6wxKQeKEDtyhkzzVvKJFElY0/B7wQsjm79T1+5ua/cOkHxWxmFr304WstT7Rk8SEo1SxJ6G0SPZYoUDX9FVwcTTyccCOZE5K/w2Om/siKBEDTDirwRDdK4ge9mtdlbUUttRFqNyqBv8bdVqBlPR90Iyf2w/N1+UcCzM9oj87lQgnuyGYDVnFY85laW6dOJkZmacigWE/25RSiXZhPouX2s+fvywV5aalYftFKeVw2CtJIDMkUU8RHk/2+UbAvmzL2T/zXU2d0dlSsxlcQOaTrh0lunxtNMsYUa3UCtr5K4z3knpVXxFxnU5J9UP23Sc3eEqKkaFs6+hQdY+Ot2/qGJcuCBxSqNPHnTrwtS8krEqVOn7/c+kxhaFBlEmGY3EAuk4ujaAwJq4ZXGczkSi4xFuCQWyTjxe1uWEKUlboZ+QY1gAp07vuYuStwMQiUoo+BJOUHWlHN4nVB7ZCW2BnQoevMruEruiH7FC6TQmuz9t0U1Un93ZRPRwp6DshwJa5jvVQyvCEUm2PePCsLdWBdl3jXkrJJtm2lBm6/Y69GG2NmbRmPPxxbzb14JZZ5KXIcy6R8WSsmgnr2C45JsZ1r9XEfSvBXaNyfkhDlTlO2prpp6ihrKR+go/J+bz+t4OhB2WGMk4cvdXf78VJiQp2lgurkd7r7oYsV2txf0uZ6ABu2bNnsYBTL9TX6LoLoS8Cz7qxKw62W2bRaGU83f2hMcz7YUMhw1ETG56tBtFU2u9k/WVsGzlpnXfW4Rnqyb68FAJU7YeLTZ2B91iFzE9tmFnzoyxfgyIxHq6s452vxZy4MGDKPadn8tkLI0Sf/l2YsHcX6zooQfHtEXT4okh+lRO9Wl4xOqefXeZXgTQhkVO9pA0Aw/MiIi/6i5/aQgt6Sw56Exw+n26kTS9QDuA1GFL5wkkv7fN0giD',
  }
  
  ssh_authorized_key { 'daenney-root@puppet-community':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAAEAQC6avnfF/hR7RgR9hPljFtNMMJoaVdIzYhNCPR90Cj2jxQ19AYAgy7dqQF0lJ4+XmcqOjpwfqrGUxr8KmuxvKx2KHYgmgK+SOiMJn4he8c7bSDU3WEPvh5uWPb8GIoyuVnYjrCSKEWyb5qx1CauUyNPwDcuOwDRIXFNMDi2rOZRw/RqrJVhzGZita0FeH72lDy3LfkNHc++N1wpypPL0GRiUCVaZQ5zL0nLcbTh7jv7znjJB2tCdQFNADHLiBBqR6AH6rnvayOZQzXafNzfyk9bzA1tlYDFx/c2N/wQ0lfmAZRn3+qHURdY63I6rY6txWuqmzTWjNdAbSvdLRKSJsBUQ5yALqe8IvLsAmxQIi+YWG9W/lgddsfNarXo+5jiG+B7+u0fDOEzNtzEaCur4to8Z2OfFEYh6brieG9rhbSv7F+pN229f6wxKQeKEDtyhkzzVvKJFElY0/B7wQsjm79T1+5ua/cOkHxWxmFr304WstT7Rk8SEo1SxJ6G0SPZYoUDX9FVwcTTyccCOZE5K/w2Om/siKBEDTDirwRDdK4ge9mtdlbUUttRFqNyqBv8bdVqBlPR90Iyf2w/N1+UcCzM9oj87lQgnuyGYDVnFY85laW6dOJkZmacigWE/25RSiXZhPouX2s+fvywV5aalYftFKeVw2CtJIDMkUU8RHk/2+UbAvmzL2T/zXU2d0dlSsxlcQOaTrh0lunxtNMsYUa3UCtr5K4z3knpVXxFxnU5J9UP23Sc3eEqKkaFs6+hQdY+Ot2/qGJcuCBxSqNPHnTrwtS8krEqVOn7/c+kxhaFBlEmGY3EAuk4ujaAwJq4ZXGczkSi4xFuCQWyTjxe1uWEKUlboZ+QY1gAp07vuYuStwMQiUoo+BJOUHWlHN4nVB7ZCW2BnQoevMruEruiH7FC6TQmuz9t0U1Un93ZRPRwp6DshwJa5jvVQyvCEUm2PePCsLdWBdl3jXkrJJtm2lBm6/Y69GG2NmbRmPPxxbzb14JZZ5KXIcy6R8WSsmgnr2C45JsZ1r9XEfSvBXaNyfkhDlTlO2prpp6ihrKR+go/J+bz+t4OhB2WGMk4cvdXf78VJiQp2lgurkd7r7oYsV2txf0uZ6ABu2bNnsYBTL9TX6LoLoS8Cz7qxKw62W2bRaGU83f2hMcz7YUMhw1ETG56tBtFU2u9k/WVsGzlpnXfW4Rnqyb68FAJU7YeLTZ2B91iFzE9tmFnzoyxfgyIxHq6s452vxZy4MGDKPadn8tkLI0Sf/l2YsHcX6zooQfHtEXT4okh+lRO9Wl4xOqefXeZXgTQhkVO9pA0Aw/MiIi/6i5/aQgt6Sw56Exw+n26kTS9QDuA1GFL5wkkv7fN0giD',
  }
  
  ssh_authorized_key { 'petems@puppet-community':
    ensure => present,
    user   => 'pcci',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDN5fRoSulsSY0YZ9wJnAACji826Dw4Tx4/RAGBGff9tQBsvrPYYSTAzzAv6Yydz7w/YlM503oYMCjfT6/LZxIt8AMrehfJ5iiGBBsN7Mpa3w3CTcrKIlozoHKInodC8wO2944PH+Y5V9K1vSx9eVhCK1pC3KiQ3fOJ3wNK27jb4m82eWRdWK5XMNIL0tlHAT4fHCqd+TjFyRKAE5Q2dnElLg+sRT4oDNtdzwXy6phIxJwo0qjTmWgVk1kSWv1/+HGGwmrVf6B1O8Eqk34WEYnLCs/bdxQBXwJ2IzQvPCofAyPTXy8HtUrXcyv3uV9UaVjc3MC3iIqELhB1r4FT1Q5v',
  }

  ssh_authorized_key { 'igalic@levix':
    ensure => present,
    user   => 'pcci',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDn+f8KdN2I/YBNPbKuNvUnrqBcfYXSay/Pt8ijnN/YsUTIAPC0UDDjpTvAWgcvVcoujATE2wb2ut4BUiHfMBneyPeSrhUclOa9x2ruwG7Ys1K/zfIdXhYz+T/4YGyZtOFZFzqHUICW78zhy//8NXRY5RDI0x8cNA/y3e2NcE5hsBNJLYyq1pDn52+4Mq+0ay44iN+1wJV6rbpvK+4chbqGXQ4B79jgKke1qe2m4O4Y7Yq8+x/oQsVSKxpZRXzY9+cGb2+za6ZsyaIYhDtISKg3qAEDU3Uddiu6MNS2jOhzdK75+OCYFXWzdlPKgdW/ibY+N78jwO3LbeGWv0veWRJh',
  }

}
