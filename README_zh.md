# :seedling: Kubean

<a href="https://trackgit.com">
<img src="https://us-central1-trackgit-analytics.cloudfunctions.net/token/ping/la6t1t81jgv27ys97ila" alt="trackgit-views" />
</a>

> [English](./README.md)

<div align="center">

  <p>

[<img src="docs/images/certified-kubernetes-color.png" height=120>](https://github.com/cncf/k8s-conformance/pull/2240)
[<img src="docs/images/kubean-logo.png" height=120>](https://kubean-io.github.io/website/)
<!--
Source: https://github.com/cncf/artwork/tree/master/projects/kubernetes/certified-kubernetes
-->

  </p>

  <p>

Kubean 是基于 [kubespray](https://github.com/kubernetes-sigs/kubespray) 构建的集群生命周期管理工具。

  </p>

  <p>

[![main workflow](https://github.com/kubean-io/kubean/actions/workflows/auto-main-ci.yaml/badge.svg)](https://github.com/kubean-io/kubean/actions/workflows/auto-main-ci.yaml)
[![codecov](https://codecov.io/gh/kubean-io/kubean/branch/main/graph/badge.svg?token=8FX807D3QQ)](https://codecov.io/gh/kubean-io/kubean)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/6263/badge)](https://bestpractices.coreinfrastructure.org/projects/6263)
[![kubean coverage](https://raw.githubusercontent.com/dasu23/e2ecoverage/master/badges/kubean/kubeanCoverage.svg)](https://github.com/kubean-io/kubean/blob/main/docs/test/kubean_testcase.md)
[![kubean coverage](https://raw.githubusercontent.com/dasu23/e2ecoverage/master/badges/kubean/kubeanCoverage2.svg)](https://github.com/kubean-io/kubean/blob/main/docs/test/kubean_testcase.md)
[![license](https://img.shields.io/badge/license-AL%202.0-blue)](https://github.com/kubean-io/kubean/blob/main/LICENSE)
[![Go Report Card](https://goreportcard.com/badge/github.com/kubean-io/kubean)](https://goreportcard.com/report/github.com/kubean-io/kubean)

  </p>

</div>

---

## :anchor: 功能超赞

- **简单易用**：通过声明式 API 实现 Kubean 和 K8s 集群强劲生命周期管理的部署。
- **支持离线**：每个版本都会发布离线包（os-pkgs、镜像、二进制包）。你不必担心如何收集所需的资源。
- **兼容性**：支持多架构交付：AMD、ARM；常见的 Linux 发行版；以及基于鲲鹏构建的麒麟操作系统。
- **可扩展性**：允许使用原生 Kubespray 自定义集群。

## :surfing_man: 快速入门

#### 1. 确保有一个 Kubernetes 集群且安装了 Helm

#### 2. 部署 Kubean-Operator

``` shell
$ helm repo add kubean-io https://kubean-io.github.io/kubean-helm-chart/
$ helm install kubean kubean-io/kubean --create-namespace -n kubean-system
```

检查 kubean-operator 状态：

```shell
$ kubectl get pods -n kubean-system | grep 'kubean'
```

#### 3. 在线模式部署最小化单节点集群

你可以使用 `examples/install/1.minimal` 文件夹中的例子，这些例子使用在线资源安装 K8s 集群。

1. 修改 `examples/install/1.minimal/AllInOne.yml`，替换 `<IP1>`、`<USERNAME>`... 等字符串为真实值

2. 启动 kubeanClusterOps，这将启动 kubespray job

   ```shell
   $ kubectl apply -f examples/install/1.minimal
   ```

3. 检查 kubespray job 状态

   ```shell
   $ kubectl get job -n kubean-system
   ```

[![quick_start_image](docs/images/quick_start.gif)](https://asciinema.org/a/511386)

## :ocean: Kubernetes 兼容性

|               | Kubernetes 1.20 | Kubernetes 1.21 | Kubernetes 1.22 | Kubernetes 1.23 | Kubernetes 1.24 | Kubernetes 1.25 | Kubernetes 1.26 |
|---------------|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|:---------------:|
| Kubean v0.4.4 |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |
| Kubean v0.4.5 |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |        ✓        |

## :book: 参考文档

- [架构](docs/zh/architecture.md)
- [Kubean 与 Kubespray](docs/zh/comparisons.md)
- [CRD 概述](docs/zh/crds.md)
- [使用 SSH Secret 密钥方法部署集群](docs/zh/sshkey_deploy_cluster.md)
- [为离线环境部署集群](docs/zh/offline.md)
- [自定义操作](docs/zh/custom_action.md)
- [增量离线包的生成和使用](docs/zh/airgap_patch_usage.md)
