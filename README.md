# benchmarking-lightweight-virtualization

## Project Overview

This project benchmarks and compares the performance of modern containerization and lightweight virtualization runtimes: containerd, gVisor, Linux containers (Incus), runc, Firecracker VMM, and CRI-O. The aim was to evaluate their efficiency and resource usage (memory, CPU, i/o and network) under similar workloads. This was an academic project for Virtualization class at UF.

## Why

The selected tools—containerd, gVisor, runc, Linux containers (Incus), and Firecracker—provide different levels of isolation between workloads, which is critical for balancing security, performance, and flexibility in virtualization environments.

- **runc**: The default low-level container runtime for Docker and containerd. It uses standard Linux namespaces and cgroups for process isolation. Suitable when performance is critical and workloads are trusted, such as microservices in internal clusters. Widely used in production by organizations like Docker and Kubernetes.
- **gVisor (runsc)**: Sandboxes containers by interposing a user-space kernel, providing an extra security layer. Useful for running untrusted code or multi-tenant environments where container breakouts are a concern. Used by Google Cloud Run and GKE Sandbox.
- **Linux containers (Incus)**: Offers system containers that behave like lightweight VMs, providing a balance between performance and isolation. Useful in scenarios where full system isolation is needed without the overhead of traditional VMs, such as CI/CD runners or hosting multiple OS environments.
- **Firecracker**: A microVM technology designed for secure, multi-tenant workloads with minimal overhead. Each microVM uses its own kernel, providing strong isolation closer to traditional VMs with near-container startup speed. Used by AWS Lambda and AWS Fargate to securely run customer workloads at scale.

Selecting these tools enables a practical comparison across the isolation spectrum—from process-based containers (runc), to sandboxed containers (gVisor), to lightweight virtual machines (Firecracker), and system containers (Incus). This helps identify the right tool for the job based on security and performance needs in modern cloud and enterprise environments. Container and micro-VM technologies are widely used for application isolation, but each has trade-offs in terms of performance, security, and resource usage. By benchmarking these runtimes, I wanted to understand their practical differences and help inform technology choices for different deployment scenarios.

## What I Learned

- Performance varies significantly between runtimes, especially with I/O and network-intensive workloads.
- Firecracker and gVisor offer strong isolation, but may introduce overhead compared to standard containers.
- Setup and integration complexity differ: some runtimes setup (like Firecracker) require more effort.
- While benchmarks are kept simple for this project, I learned how to keep environments consistent and repeatable scripts for fair comparisons.

## Code Overview

- Each runtime is set up in its own subdirectory under `src/` (e.g., `src/firecracker`, `src/gvisor`, etc.).
- Benchmark scripts (`src/bench/`) are used to run identical workloads on each runtime.
- Results are collected in `src/results/` for comparison and analysis.

```
benchmarking-lightweight-virtualization/
|
|-- src/
|    |-- bench/         # Benchmark scripts
|    |-- crio/          # CRI-O setup and scenarios
|    |-- firecracker/   # Firecracker VM setup and scenarios
|    |-- gvisor/        # gVisor setup and scenarios
|    |-- incus/         # Incus (Linux containers) setup
|    |-- results/       # Benchmark script logs
|-- Readme.pdf          # Detailed original report
```

- Each runtime directory contains setup scripts and instructions.
- Benchmark scripts automate launching, workload execution, and teardown for each environment.
- Results are stored as text or CSV files in `src/results/`.

## Instructions to Reproduce

1. Clone the repository:
   ```
   git clone https://github.com/nitingoyal0996/benchmarking-lightweight-virtualization.git
   cd benchmarking-lightweight-virtualization
   ```

2. Review and follow the setup instructions in each `src/<runtime>/` directory for installing and configuring the runtimes (runc, gvisor, incus, crio, firecracker).

3. Use the scripts in `src/bench/` to run the benchmarks across all environments.

4. Check `src/results/` for performance data and logs.

5. For detailed methodology and results, refer to `Readme.pdf`.
