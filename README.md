# Playing with Jenkins

See also the orgiginal situation in repo: recepten_create.

Initial I used Julia 1.5.3. Now I want to update the application to Julia 1.6.0 and made changes in:
- docker-compose.yml: image: 127.0.0.1:5000/i_recepten:v2
- recepten.Dockerfile: ENV julia=julia-1.6.0
- Jenkins: curl -O https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.0-linux-x86_64.tar.gz
