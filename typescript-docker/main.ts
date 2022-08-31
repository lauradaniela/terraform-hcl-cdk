import { Construct } from "constructs";
import { App, TerraformStack } from "cdktf";
import { Image, Container, DockerProvider } from './.gen/providers/docker'

class MyStack extends TerraformStack {
  constructor(scope: Construct, name: string) {
    super(scope, name);

    new DockerProvider(this, "docker", {});

    const dockerImage = new Image(this, 'nginxImage',{
      name: 'nginx:latest',
      keepLocally: false, 
    });

    new Container(this, "nginxContainer", {
      name: "tutorial",
      image: dockerImage.latest,
      ports: [
        {
          internal: 80,
          external: 8000,
        },
      ],
    });
  }
}

const app = new App();
new MyStack(app, "typescript-docker");
app.synth();
