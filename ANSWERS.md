# HW4 — Short Answers

Answer each question in 2–3 sentences.

## 1. Rolling-update safety
Why does the Deployment use `maxUnavailable: 0`, and what would change if it were `maxUnavailable: 1`?

`maxUnavailable` is set to 0 so that the rolling update does not reduce the number of available pods below the desired three replicas. With `maxSurge` set to 1, Kubernetes keeps the old pods available while starting one new pod, waits until the new pod becomes available before removing an old pod, and repeats this process until all three pods run the new application version (v2).
If `maxUnavailable` is set to 1, Kubernetes allows the number of available pods to fall to two during the update, potentially reducing capacity; it may start a new pod and remove an old pod without waiting for the new pod to become available.

## 2. Health probes
Why do the liveness/readiness probes target `/health` instead of `/predict`?

The readiness probe checks whether the pod is ready to receive traffic; if it fails, Kubernetes stops routing traffic to that pod. The liveness probe checks whether the application is still functioning; after repeated failures, Kubernetes restarts the container. Both use `/health` because it is lightweight and does not require an actual prediction, while `/predict` adds workload and can fail for other reasons, such as Redis problems, potentially causing unnecessary traffic rerouting or restarts.

## 3. Autoscaling under load
Your HPA scales at 40% CPU up to 8 pods. If request volume doubled, what would you expect to happen — and what happens once it reaches the maximum?
Although the HPA target is 40%, current CPU utilization is only about 2%, so doubling request volume might raise it to roughly 4% and would likely leave the replica count unchanged.
If traffic increases substantially and average CPU utilization rises sufficiently above the 40% target, the HPA will add replicas to bring utilization back toward that target. Once it reaches eight pods, it cannot add more. So CPU utilization will keep increasing even if it reaches the maximum 40% target(for scaling) and further load may cause slower responses or failed requests if available capacity is exhausted.

## AI assistance disclosure
I used ChatGPT to explain assignment instructions and Kubernetes concepts, guide deployment and troubleshooting, and help with formating and minor language edit of my answers and README. I ran the deployment demonstrations and captured the evidence myself.
