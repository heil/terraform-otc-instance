#cloud-config
hostname: "${hostname}"

fqdn: "${hostname}.${domain_name}"

manage_etc_hosts: true

packages:
  - curl
  - wget
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIdpKLrgFE++oIBgrGB7AXfEQc7FKg0XQT1vTkre+KPDSrDk0hyOKor7BkUtg3IHVRz+XuCCSEiagcH0gznBwC1bK33LzhY59ooZYej4kTWMURONoflfGE6H0bVzHvcVYoqtsvAFRqno+TPpZciOTcwt42870Gp4KUGmJvoI328nSwXq0J9WOuDR7QyTO1kCZtFZeqJIHoQ7J3ZvGz1isH73w+CrVeL4w7FN9js6BdUJy4Bu5QL0mw/2V3uzkGhnJBXQrKjjO2g/8jr3YC3Uyg97o+U1V4PBzuoUVEJrqJBtCNN1CKRb2ZBJvNLVtQw1fJAMQltrzwR1JPMA+Ovjac+xIL9A1TNrtnIGUDTNuuHc8gXPStGkq0v9LS7WaDf1olTahXV7ony9kGeP1i33SChMyGKTT/9ng38glA8IBNkwUxixYA5hKvQUvZZw+0AJ5NpACOnij7Tk7lmPuXQfTMlDnAm2i/vlBey5QMiFDRc5R4pCmP6HRzh9bizCfQ2xNwtGn8mrivdxsuQYgrEyhsKSQxTU4ooyicgKING1Hg1y0VRTLQaAMC5djHNkOp2VUAcKihyHVjA72wN0MB2bI2lbV3u8sYd9nQxizD/QBjAp8+IqzG1dHbjqeKI4QM/r0aMWnb40EedO6SKLGz7mfVaeVID8GlcdbTtUFdYMiU7w== thomas@cloudformers.io
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD0YqjPvHvgz2m+MxPS7gwWy+vAjnadYEopYiH1uGedPjNiW9c5msXBQDeui06yXQPUJWQlZG4gnFrtGI6t9cv8fckZM1ZRGnFyrfoLIcdJ42fMNP3QW0w6nWYEoAPmIqP8TOTF0Fg+diY6L9b0omOZZYZ2kz1uJ6tNvKPGQjduoHJnCvsIV/krB8GL0htNfd++mQxHCJuyeRQUHSql3xBwCz31F/H32uYfb7gQADFxC+S1jPMFo4UWn4ofbzkNn8a5256N8sS017+nrJ51wr4XsQKFTtpytQEp0iz42JUX3eD1M9iXAFnhY92dDz/YoClmIULibH2wLRg2THltYs0uy5hYP6rxXEqk9kgzfZTvhjW6ZhJKEcPTbB/Ycqk4LYWhQ84+OOStxwPZw0kOlExF14b1NgND0YlFGGOzUjeVp8MKAKvsrKLlmL+3ayjzds++g/Py5PnhwYQFHDStY7b3+UeESchnxyaTcyighR2uh18pG49IwUKoqPkRogFXyyW/w4vO1oFmHtQXOeIDs05er2vefGu98ielimwqtgpc5nHztBiSFxzyA+Q23PxH2lr6qNF2PL49FZTPKIxWRkh4sjaN0aBxfOH60qepB3bbGCAabUxRZ1p6v9Xk7HRYyhounf9w8HyHn30J6bPG84ks61Ei8Y77sMLJEUWXneG3wQ== heil@jun
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDP172RK9+BGwEy4csbbhDsmlcwWW5eQ40PMjySSPb3iEzMaC8WHUS7tDpXi9kqj19hYz96Fm3cD9Ku5c5RJrl5rdPulwDK4xzFJ5X4o0LzvvZsItWn/mW5yKN3m7yAt1q5L7C1wALCCuWEVJZaDsTDc2OwMipDL95yqOqMCrqkcryVQTCdgyewR+eThXr+yUnea9X89N+0HMqdpezPaVILAKRLyA3W6QlpM8i7qlheoaYneNEWPJfscHgM8VXKloi2EzbCTbgKJwxn1+SG4nBINs20u4nIr34m6+Vf1WSqMKL0Ilk+uwL/k4gh7/JOfn80OXiNzzCvXQcx7AXm7wHVv3xhSXnDg+Is5zasXvRlCEXyfBxtOb2IWyrmAhIfcRKM1y+/q7gWdQflyuYKjAXl3lWg1IkvgwULgxZsGrC1cwaNAqDdaM08Lz+V3ykFfhESIOJDfOc5iDjWlczTRVyfJ9QNheSWWLYSz67A/IcHn3FZ/bg+r0plgTGlVhSUfyHhOONlI+DKK5qnPYD+CwtQQQNoha7Gpeec3sT+83bdwGhl6dXDCrSBS28jH0gPryHPXHXgvNQYipvyfKz41OxDXN4+LFrqg2kPrn7menN112RXzkFThe1zygG8am9yqPhMi+tEVwwabDLdPHQcKuvXuHzViFhG7v6k8pHxDRya4Q== pkirsch@marconi.site
      - ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxL23YaL3R0fF8Euc4txiXS8FPDa6CE6BKCHrRRFyVrGghol6M2H/H2jbSQQBgFDyDd0ARLyu3MgJYOSVBbERWzkU/CBdi6sTqD0N66R6kAiqTy0JbTn+tGp7PQs29Jj8hHpAp7lXJPTxISXm8+jnvbl9cdBDqwdTh7ddVyOuF0NRJEpwN+2r7o7s2z2Gkn2TenLhuZvAkQF6w0cqebbEkOaXWVhzswk5/BETsOVtef3KJmahvM/nBngdVqfwAHorj7oO2vUPBeamRlmbwHX+xbIpf0aQ9K0YKuEyYd1vGiy9gAmTeBxVSARNjOlrjzaygZYuIZPPRXgk0VDfjRl2Sw== kadmin@linux-svab