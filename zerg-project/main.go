// A generated module for ZergProject functions
//
// This module has been generated via dagger init and serves as a reference to
// basic module structure as you get started with Dagger.
//
// Two functions have been pre-created. You can modify, delete, or add to them,
// as needed. They demonstrate usage of arguments and return types using simple
// echo and grep commands. The functions can be called from the dagger CLI or
// from one of the SDKs.
//
// The first line in this comment block is a short description line and the
// rest is a long description with more detail on the module's purpose or usage,
// if appropriate. All modules should have a short description.

package main

import (
	"context"
	"dagger/zerg-project/internal/dagger"
)

type ZergProject struct{
	Container *dagger.Container
}

func New(
	// +optional
	// +default="milou666/zerg-project:latest"
	image string,
) *ZergProject {
	return &ZergProject{
		Container: dag.Container().From(image).WithMountedTemp("/storage"),
	}
}

// Returns a container that echoes whatever string argument is provided
func (m *ZergProject) ContainerEcho(stringArg string) *dagger.Container {
	return dag.Container().From("alpine:latest").WithExec([]string{"echo", stringArg})
}

// Returns lines that match a pattern in the files of the provided Directory
func (m *ZergProject) GrepDir(ctx context.Context, directoryArg *dagger.Directory, pattern string) (string, error) {
	return dag.Container().
		From("alpine:latest").
		WithMountedDirectory("/mnt", directoryArg).
		WithWorkdir("/mnt").
		WithExec([]string{"grep", "-R", pattern, "."}).
		Stdout(ctx)
}

func (s *ZergProject) Play(ctx context.Context, starcraftIso *dagger.File, windowsIso *dagger.File) *dagger.Service {
	return s.Container.
		WithMountedFile("/images/starcraft.iso", starcraftIso).
		WithMountedFile("/images/windows.iso", windowsIso).
		WithEnvVariable("STARCRAFT_ISO", "/images/starcraft.iso").
		WithEnvVariable("WIN_ISO", "/images/windows.iso").
		WithExposedPort(5900).
		AsService(dagger.ContainerAsServiceOpts{
			Args: []string{"/run/entry.sh"},
			InsecureRootCapabilities: true,
		})
}
