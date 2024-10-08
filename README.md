
#### Terroform + multipass + k3s 搭建本地k8s开发环境

- 由于某些原因K3S的镜像好像在本地拉不下来,所以我在初始化vm的时候通过cloud_init挂了代理。大家可以看情况去掉或者改成自己的配置
- k3s在安装过程中会通过ssh到vm里执行一些命令，ssh当前我用的是免密，有需要的话大家可以自行修改为自己的公钥，或者直接修改为密码登录。可以直接修改[`modules/vm/cloudinit_file`](https://github.com/yasyx/tf-multipaas-k3s-dev/blob/783a1ab9dac8a820622c92fbcfc5bf21696371b8/modules/vm/files/cloudinit_file)中的内容
- 对`cloudinit`不熟悉的同学，可以参考 [`cloudinit`](https://cloudinit.readthedocs.io/en/latest/reference/modules.html) 这个链接。 我这里仅用到了两个modules [`user-and-groups`](https://cloudinit.readthedocs.io/en/latest/reference/modules.html#users-and-groups) , [`runcmd`](https://cloudinit.readthedocs.io/en/latest/reference/modules.html#runcmd)

#### What have I done
- Create a vm called `k3server`.
- Create a `k8s` instance by `k3s`.
- Delpoy `argocd` in `k3s` by `helm`.

#### Requirements
- [terraform](https://developer.hashicorp.com/terraform/install)
- [helm install](https://helm.sh/docs/intro/install/)
- [multipass install](https://multipass.run/install)
- [kubectl install](https://kubernetes.io/docs/tasks/tools/) 

#### How to use

```shell
cd ./dev 
terraform apply --autoapprove
```
