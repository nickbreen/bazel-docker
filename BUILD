load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_layer")
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit", "container_run_and_extract")

container_layer(
    name = "layer",
    files = ["hello.txt"],
)

container_image(
    name = "image",
    base = "@centos-8//image",
    layers = [":layer"],
)

container_run_and_commit(
    name = "install",
    commands = [
        """touch foo.txt""",
    ],
    image = ":image",
)

container_run_and_extract(
    name = "test-data",
    commands = [
        """find / -maxdepth 1 -type f -fprint /tmp/out.txt""",
    ],
    image = ":install_commit.tar",
    extract_file = "/tmp/out.txt",
)

sh_test(
    name = "test",
    srcs = ["test.sh"],
    data = [":test-data"],
    args = ["$(locations :test-data)"]
)
