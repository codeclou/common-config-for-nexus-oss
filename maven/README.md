## Api Doc

### Maven Proxy

```java
import org.sonatype.nexus.repository.maven.LayoutPolicy;
import org.sonatype.nexus.repository.maven.VersionPolicy;

public Repository createMavenProxy(String name, String remoteUrl, String blobStoreName, boolean strictContentTypeValidation, VersionPolicy versionPolicy, LayoutPolicy layoutPolicy);
```

 * VersionPolicy: `release, snapshot, mixed`
 * LayoutPolicy: `strict, permissive`
 * blobStoreName: `default`
 * strictContentTypeValidation: `false` = we need this, so that abstract pom types can be downloaded

Example Groovy:

```groovy
import org.sonatype.nexus.repository.maven.LayoutPolicy;
import org.sonatype.nexus.repository.maven.VersionPolicy;

repository.createMavenProxy('atlassian-snapshot', 'https://maven.atlassian.com/public-snapshot/', 'default', false, VersionPolicy.MIXED, LayoutPolicy.PERMISSIVE);
```


