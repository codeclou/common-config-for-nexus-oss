# common-config-for-nexus-oss

A set of REST API scripts to configure your [Sonatype Nexus Repository Manager OSS](https://www.sonatype.com/nexus-repository-oss)  after initial setup.


-----

&nbsp;

### Prerequisites

To run the bash scripts provided by this repo you need to provide the following Environment variables.
At best put the in your `~/.bashrc`

```bash
export NEXUS_BASE_URL="http://localhost:8080" # base URL to Nexus OSS
export NEXUS_AUTH="admin:admin123"            # username + password
```

-----

&nbsp;

### Usage

There are several scripts for different purposes.

**(1) Maven Proxy Repositories**

To create Maven Proxy Repositories as defined in [`proxy-repositories.txt`](https://github.com/codeclou/common-config-for-nexus-oss/blob/master/maven/proxy-repositories.txt) run:

```bash
git clone https://github.com/codeclou/common-config-for-nexus-oss.git
cd common-config-for-nexus-oss
cd maven
bash create-proxy-repositories.sh
```

<p align="center"><img src="https://codeclou.github.io/common-config-for-nexus-oss/created-maven-proxy-repositories.png?v22" width="80%" /></p>

-----

&nbsp;

### Trademarks and Third Party Licenses

 * **Sonatype Nexus OSS**
   * Sonatype and Sonatype Nexus are trademarks of [Sonatype, Inc](https://www.sonatype.org/).
   * Sonatype Nexus OSS is licensed under the [Eclipse Public License 1.0](https://github.com/sonatype/nexus-public/blob/master/LICENSE.txt).
 * **Apache Maven**
   * Apache Maven and Maven are trademarks of the [Apache Software Foundation](http://www.apache.org/).
 * **Oracle Java JDK 8**
   * Oracle and Java are registered [trademarks of Oracle](https://www.oracle.com/legal/trademarks.html) and/or its affiliates. Other names may be trademarks of their respective owners.
   * Please check yourself for corresponding Licenses and Terms of Use at [www.oracle.com](https://www.oracle.com/).
 * **Docker**
   * Docker and the Docker logo are trademarks or registered [trademarks of Docker](https://www.docker.com/trademark-guidelines), Inc. in the United States and/or other countries. Docker, Inc. and other parties may also have trademark rights in other terms used herein.
   * Please check yourself for corresponding Licenses and Terms of Use at [www.docker.com](https://www.docker.com/).
 * **Ubuntu**
   * Ubuntu and Canonical are registered [trademarks of Canonical Ltd.](https://www.ubuntu.com/legal/short-terms)
 * **Apple**
   * macOS®, Mac and OS X are [trademarks of Apple Inc.](http://www.apple.com/legal/intellectual-property/trademark/appletmlist.html), registered in the U.S. and other countries.
   
-----

&nbsp;

### License

[MIT](https://github.com/codeclou/common-config-for-nexus-oss/blob/master/LICENSE) © [Bernhard Grünewaldt](https://github.com/clouless)
