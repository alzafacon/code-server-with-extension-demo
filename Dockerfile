FROM codercom/code-server:latest

COPY --chown=coder ms-azuretools.vscode-docker-1.22.2.vsix /source/extension.vsix
COPY --chown=coder code-server.vscode/ /source/code-server.vscode

# --install-extension option will always exit
# so extension has to be installed before ENTRYPOINT
# also use the correct --user-data-dir
RUN code-server --user-data-dir /source/code-server.vscode --install-extension /source/extension.vsix

CMD ["/source", "--auth", "none", "--disable-update-check", "--disable-telemetry", "--user-data-dir", "/source/code-server.vscode"]