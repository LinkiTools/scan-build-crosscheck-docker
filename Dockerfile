FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y gcc git cmake wget unzip g++ python libxml2-dev ninja-build && \
    apt-get clean
RUN wget https://github.com/Z3Prover/z3/releases/download/z3-4.8.4/z3-4.8.4.d6df51951f4c-x64-debian-8.11.zip && \
    unzip z3-4.8.4.d6df51951f4c-x64-debian-8.11.zip && \
    mv z3-4.8.4.d6df51951f4c-x64-debian-8.11/bin/* /usr/local/bin && \
    mv z3-4.8.4.d6df51951f4c-x64-debian-8.11/include/* /usr/local/include && \
    rm -Rf z3-4.8.4.d6df51951f4c-x64-debian-8.11.zip z3-4.8.4.d6df51951f4c-x64-debian-8.11
RUN git clone https://github.com/llvm/llvm-project.git && \
    mkdir llvm-project/build && \
    cd llvm-project/build && \
    cmake -DCLANG_ANALYZER_ENABLE_Z3_SOLVER=ON -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr/local -G Ninja ../llvm/ && \
    ninja && \
    ninja install && \
    cd ../../ && \
    rm -Rf llvm-project

CMD ["/bin/bash"]
