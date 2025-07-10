# [3.2.0](https://github.com/cktf/terraform-hcloud-cluster/compare/3.1.0...3.2.0) (2025-07-10)


### Features

* create placement group without condition ([be5de3d](https://github.com/cktf/terraform-hcloud-cluster/commit/be5de3d9dca70833c414b29aae465e42c6f503c2))

# [3.1.0](https://github.com/cktf/terraform-hcloud-cluster/compare/3.0.0...3.1.0) (2025-07-09)


### Features

* make public_key, private_key sensitive ([2844770](https://github.com/cktf/terraform-hcloud-cluster/commit/2844770f0a81dde3f0d2968dd552546ed47b4d4a))

# [3.0.0](https://github.com/cktf/terraform-hcloud-cluster/compare/2.0.0...3.0.0) (2025-07-05)


### Bug Fixes

* add placement group labels ([7d5bd85](https://github.com/cktf/terraform-hcloud-cluster/commit/7d5bd85d1fb9bbf737a98e6bee0670b9eb28b352))


### Features

* add volumes, groups ([2d60d74](https://github.com/cktf/terraform-hcloud-cluster/commit/2d60d7453efa0e6cfea8d7ed12a69672bb374809))
* remove gateway variable ([f493ce3](https://github.com/cktf/terraform-hcloud-cluster/commit/f493ce3b6a7a56759285131f1830a5938df2aae7))
* support external volumes ([e60bd96](https://github.com/cktf/terraform-hcloud-cluster/commit/e60bd964e8c9ee0cebdecf5097806de130526711))


### BREAKING CHANGES

* change variables

# [2.0.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.24.0...2.0.0) (2025-06-06)


### Features

* move firewall rules from cluster to network module ([51749eb](https://github.com/cktf/terraform-hcloud-cluster/commit/51749eb643d3e21cef8ac8e72557fb907f2be245))


### BREAKING CHANGES

* remove firewall rules

# [1.24.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.23.2...1.24.0) (2025-02-22)


### Features

* add new CI ([49c8970](https://github.com/cktf/terraform-hcloud-cluster/commit/49c8970c18e6dd176b772f74394066b69ab16daa))

## [1.23.2](https://github.com/cktf/terraform-hcloud-cluster/compare/1.23.1...1.23.2) (2025-01-22)


### Bug Fixes

* remove default load_balancer zone value ([aa9bf08](https://github.com/cktf/terraform-hcloud-cluster/commit/aa9bf08682abe1ef343f9e12256f3594b30f66d6))

## [1.23.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.23.0...1.23.1) (2024-11-30)


### Bug Fixes

* change setup_network command ([c59099b](https://github.com/cktf/terraform-hcloud-cluster/commit/c59099bf441ca6c0741812a3126c693446f21d98))

# [1.23.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.22.0...1.23.0) (2024-11-26)


### Features

* add optional gateway variable ([609a713](https://github.com/cktf/terraform-hcloud-cluster/commit/609a7135bcd1594f9bf6474514879ee12b2786a7))
* add volumes output ([5202ea8](https://github.com/cktf/terraform-hcloud-cluster/commit/5202ea84ba196382460cd340dae44e29f69e0a02))

# [1.22.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.21.2...1.22.0) (2024-11-04)


### Features

* add gateway variable to servers ([ad1ede8](https://github.com/cktf/terraform-hcloud-cluster/commit/ad1ede8da8664212da6094a44d6d6d0437de817f))

## [1.21.2](https://github.com/cktf/terraform-hcloud-cluster/compare/1.21.1...1.21.2) (2024-11-03)


### Bug Fixes

* disable ssh_deletekeys in cloud-init ([3033f77](https://github.com/cktf/terraform-hcloud-cluster/commit/3033f77ff2c347de80be59dda10cf0c8ed094510))

## [1.21.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.21.0...1.21.1) (2024-11-03)


### Bug Fixes

* user_data network script permission problem ([53a260b](https://github.com/cktf/terraform-hcloud-cluster/commit/53a260bfbdb721ce4daaa8f5bacd128ca42c3870))

# [1.21.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.20.0...1.21.0) (2024-11-03)


### Features

* change variables and providers ([aa161b3](https://github.com/cktf/terraform-hcloud-cluster/commit/aa161b39ecce888204e66ffd849b369e2044ee36))

# [1.20.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.19.0...1.20.0) (2024-11-03)


### Bug Fixes

* change user_data template name ([cbccd46](https://github.com/cktf/terraform-hcloud-cluster/commit/cbccd463a12306aadb307a40e2ad6701443df01c))


### Features

* add public_key and private_key external variables ([cf7f9cf](https://github.com/cktf/terraform-hcloud-cluster/commit/cf7f9cfa89464301ba26b2286cf27fff741e0845))

# [1.19.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.18.0...1.19.0) (2024-11-03)


### Features

* add static has_ssh_key and has_network variables ([a62c472](https://github.com/cktf/terraform-hcloud-cluster/commit/a62c472d45046e3675a00720d67eb8d320b15752))

# [1.18.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.17.0...1.18.0) (2024-11-03)


### Features

* add external ssh_key ([a84a1cf](https://github.com/cktf/terraform-hcloud-cluster/commit/a84a1cf74249820e9f959dae6eddcca150959f0d))

# [1.17.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.16.0...1.17.0) (2024-11-03)


### Features

* add static attach toggle for private network ([c9b7cf7](https://github.com/cktf/terraform-hcloud-cluster/commit/c9b7cf7ad10d336bb7cfeede47ec3e8aaa86e597))

# [1.16.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.15.0...1.16.0) (2024-11-03)


### Features

* add servers private_host output ([77d357f](https://github.com/cktf/terraform-hcloud-cluster/commit/77d357f2313aa69a2aec2af4c2313429015bcceb))

# [1.15.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.14.0...1.15.0) (2024-11-03)


### Features

* generalize setup.sh to support all linux OSes ([c8e231e](https://github.com/cktf/terraform-hcloud-cluster/commit/c8e231e9340533c51a18e945e0b44dd2267b3324))

# [1.14.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.13.0...1.14.0) (2024-10-30)


### Features

* support all OS types in private network setup and support NAT gateway setup ([0885663](https://github.com/cktf/terraform-hcloud-cluster/commit/0885663276f6ed7020486f8fc5495612b0461eb5))

# [1.13.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.12.2...1.13.0) (2024-10-30)


### Features

* add servers protection variable ([4e8a848](https://github.com/cktf/terraform-hcloud-cluster/commit/4e8a848bf20027eda1f99265851a79686d257c39))

## [1.12.2](https://github.com/cktf/terraform-hcloud-cluster/compare/1.12.1...1.12.2) (2024-10-23)


### Bug Fixes

* add load_balancer default zone ([0983790](https://github.com/cktf/terraform-hcloud-cluster/commit/0983790d9a3230a6b651a0744c520d0bd163220f))

## [1.12.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.12.0...1.12.1) (2024-10-23)


### Bug Fixes

* change firewall selectors ([a39c61c](https://github.com/cktf/terraform-hcloud-cluster/commit/a39c61c12b78a784e25a35bd56cb567fef9bb00d))

# [1.12.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.11.0...1.12.0) (2024-10-23)


### Features

* add groups output to servers ([1044254](https://github.com/cktf/terraform-hcloud-cluster/commit/1044254dec25798c5426f042ade30d7d7d9416c3))

# [1.11.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.10.0...1.11.0) (2024-10-23)


### Bug Fixes

* change optional arguments ([7799f9d](https://github.com/cktf/terraform-hcloud-cluster/commit/7799f9de6b2c9ba98899df3c624be7fda75d5d31))
* private node wait for interface ([56af758](https://github.com/cktf/terraform-hcloud-cluster/commit/56af7582b591b2e27b7875dacfae9988779902bf))


### Features

* add groups selector ([d986986](https://github.com/cktf/terraform-hcloud-cluster/commit/d98698638c57f98722452a088fe9a8f9c4490c3e))

# [1.10.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.9.0...1.10.0) (2024-10-18)


### Features

* parametrize placement_groups by first server role ([696bef8](https://github.com/cktf/terraform-hcloud-cluster/commit/696bef8c74112745e43ba5e64171c276f0670333))

# [1.9.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.8.1...1.9.0) (2024-10-18)


### Features

* remove dummy roles output ([ebeeb52](https://github.com/cktf/terraform-hcloud-cluster/commit/ebeeb5237376dd199969910c4e04d37d4b20b9ff))

## [1.8.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.8.0...1.8.1) (2024-10-18)


### Bug Fixes

* change roles type to list ([8c6922d](https://github.com/cktf/terraform-hcloud-cluster/commit/8c6922dfc559e1117c35b1d6f6cd039db9de3033))

# [1.8.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.7.0...1.8.0) (2024-10-18)


### Features

* add roles output ([35e4ed2](https://github.com/cktf/terraform-hcloud-cluster/commit/35e4ed21d7896a160dc471129d60910a883cef3a))

# [1.7.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.6.1...1.7.0) (2024-10-16)


### Features

* set inbounds, outbounds variables optional ([2088be4](https://github.com/cktf/terraform-hcloud-cluster/commit/2088be45ff1dae525e8b2c19e43ac193afade58f))

## [1.6.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.6.0...1.6.1) (2024-10-09)


### Bug Fixes

* change CI/CD cache version ([4e9a286](https://github.com/cktf/terraform-hcloud-cluster/commit/4e9a286e2074f5bb6c2552f3347217c5254598bb))

# [1.6.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.5.0...1.6.0) (2024-10-09)


### Bug Fixes

* syntax problem ([76cb5ea](https://github.com/cktf/terraform-hcloud-cluster/commit/76cb5ea01c591a872d16c7a27af78e72f9b3e5df))


### Features

* add server volumes ([15dc272](https://github.com/cktf/terraform-hcloud-cluster/commit/15dc27237021c8965410f37ddc867fde7e77aff7))

# [1.5.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.4.0...1.5.0) (2024-09-21)


### Features

* change templates directory ([6304feb](https://github.com/cktf/terraform-hcloud-cluster/commit/6304feb559328534ba3cf3fdd442138c6f768756))

# [1.4.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.3.0...1.4.0) (2024-09-21)


### Bug Fixes

* change CI/CD ([570792a](https://github.com/cktf/terraform-hcloud-cluster/commit/570792a5b4e407f4b426edc4837bef6c0d73150b))


### Features

* flatten servers variable ([d88b7c1](https://github.com/cktf/terraform-hcloud-cluster/commit/d88b7c1f3fe8efcf6fbdda781d1fb15f61d2c524))

# [1.3.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.2.0...1.3.0) (2024-08-06)


### Features

* add ssh_key id output ([275f3a7](https://github.com/cktf/terraform-hcloud-cluster/commit/275f3a74fcffd746db5e07625e5c086c16bfc198))

# [1.2.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.1.1...1.2.0) (2024-08-06)


### Features

* add load_balancers output ([fb5c8cf](https://github.com/cktf/terraform-hcloud-cluster/commit/fb5c8cfcc8c214327bc9dc6a61ba18b05c383b41))

## [1.1.1](https://github.com/cktf/terraform-hcloud-cluster/compare/1.1.0...1.1.1) (2024-08-06)


### Bug Fixes

* change README ([a615810](https://github.com/cktf/terraform-hcloud-cluster/commit/a615810a05c9d8208f809d485c8d363d2f508c15))

# [1.1.0](https://github.com/cktf/terraform-hcloud-cluster/compare/1.0.0...1.1.0) (2024-08-06)


### Bug Fixes

* change servers variable to groups ([0b943a0](https://github.com/cktf/terraform-hcloud-cluster/commit/0b943a0010af615920c85bae80df79fd3d5a46bf))
* ignore cloud-init exit code ([b18d9d5](https://github.com/cktf/terraform-hcloud-cluster/commit/b18d9d51eb3e76e0bec75d18276dc8b01fb65aa7))
* syntax problem in load_balancers ([d917980](https://github.com/cktf/terraform-hcloud-cluster/commit/d917980f12dd34174cfaee77f4b39b5d9d8f8dea))


### Features

* add load_balancers ([4a67894](https://github.com/cktf/terraform-hcloud-cluster/commit/4a6789444ed2cde9c3b838918fb8e7676b030476))

# 1.0.0 (2024-08-05)


### Bug Fixes

* disable release ([9f323d9](https://github.com/cktf/terraform-hcloud-cluster/commit/9f323d92266b3cf8508ec886f329948de9229353))


### Features

* add firewalls ([e04ae8d](https://github.com/cktf/terraform-hcloud-cluster/commit/e04ae8da35c7d35b2ab890b754739933b55398da))
* enable release job in CI/CD ([0b6db73](https://github.com/cktf/terraform-hcloud-cluster/commit/0b6db73305d10f8fc2ed9c01006ea2415436f8cd))
* init project ([034cddc](https://github.com/cktf/terraform-hcloud-cluster/commit/034cddc75f6f2d85bb602e4259ca3a940eea86bd))
* init project ([330439a](https://github.com/cktf/terraform-hcloud-cluster/commit/330439ae937660d0a7c9b13b584a55b4906143e0))
