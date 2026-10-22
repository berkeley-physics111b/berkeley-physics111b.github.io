---
title: "Exponential Probability Distributions"
order: 2
summary: "Deriving the decaying exponential distribution from first principles and applying it to particle decay rates."
---

**Jump to**

1.  [Decaying Exponential](#decaying-exponential)
2.  [Particle Decay Rates](#particle-decay-rates)
3.  [Link to Error Analysis Resources (From EAX)](#links-to-error-analysis-resources)

-----

## **Decaying Exponential**

Whenever the probability of an event's occurring is independent of time, the resulting distribution is a decaying exponential. We will derive this from first principles using the example of particle decay: When we begin observing a particle, we define that time to be t=0. Let $\lambda$ be the constant probability that the particle will decay in unit time. Then at any instant, $\lambda\triangle t$ is the probability that the particle will decay in the next time period $\triangle t$, provided $\lambda\triangle t<<1$. We assume the decay of the particle follows some distribution D(t), $t>0$, where t is the measured lifetime.

D(t) has the following properties:

$\int_0^\infty D(t)\, dt=1$ and

$\int_{t_0-\frac{\triangle t}{2}}^{t_0-\frac{\triangle t}{2}}\, dt$ is the probability that the particle will decay in a period of time $\triangle t$ around $t_0$.

Because D(t) is a probability distribution of lifetimes, the probability that a particle survives to an age $t_0$ is given by:

$P_{Sur}(t_0)=\int_{t_0}^{\infty}D(t)\, dt$. (A.1)

Let us deduce the probability $P_{Sur}(t_0)$ and use it calculate D(t): If $\lambda\triangle t$ is the approximate probability that a particle decays in time $\triangle t$, then the chance that it survives is $1-\lambda\triangle t$. So just as the chance of flipping *n* consecutive heads is $(\frac{1}{2})^n$, the chance that the particle survives to time $t_0$ is

$(1-\lambda\triangle t)^\frac{t_0}{\triangle t}$.

The approximation becomes perfect in the limit as $\triangle t\rightarrow 0$, which gives

$P_{Sur}(t_0)=\lim_{\triangle t\rightarrow 0}(1-\lambda \triangle t)^{\frac{t_0}{\triangle t}}=e^{-\lambda t_0}$

(recall from calculus that $\lim_{n\rightarrow \infty} (1+\frac{x}{n})^n=e^x$).

Substituting this for $P_{Sur}(t_0)$ and differentiating both sides of (A.1):

$\frac{d}{dt}e^{-\lambda t}=\frac{d}{dt}\int_t^{\infty}D(t')\, dt'$ gives $-\lambda e^{-\lambda t}=-D(t)$, our desired result.

This applies to many other processes such as particle-beam attenuation through matter, random noise pulses, uncorrelated non-stopping cosmic rays, and finding parking-spaces.

# Particle Decay-Rates

There has been so much confusion in the past (by students and staff alike) surrounding the concept of life-time, decay-rates, and what we measure in this experiment that we feel compelled to include this short explanation. You are probably already familiar with particle decay;

It was probably explained to you some thing like this:

We define the decay constant l of a particle as the instantaneous probability that it will decay, but given in units of reciprocal time. This presents a problem: it appears that $l$ is the probability that a particle will decay in unit time (as indeed some texts define it). This is approximately true only if $l << 1$. Similarly, the probability that a particle will decay in a period dt is $l $ dt, provided that dt $<< 1/l$. This is a tricky definition at best. While it makes sense that if a particle has a .000001/sec decay constant, then it has a .0001% chance of decaying each second; a different particle may have a decay-rate of 500,000/sec, yet it can survive for days.

Consider then a large population of $N$ similar particles each with the decay rate $l$, then the number of decays that you would observe in a period of time is $lN$ Dt (provided that Dt is small compared to $1/l$). This suggests the following differential equation: $\frac{dN}{dt}=-\lambda N$, which has the solution: $N(t)=N_0e^{-\lambda t}$, where $N_0$ is the population at time $t=0$. This is the functional form of the decay of a population of particles. This suggests a pile of particles, localized in space and time, whose numbers are declining. This may have really confused students in the past, because there is no such population measured in this lab. This lab makes a one-by-one survey of decaying muons, timing the life of each new one that enters the detector, and builds a distribution, or histogram, from the measured lifetimes. To know the functional form, D(t), that the distribution of lifetimes should take requires you to make the interpretational leap that D(t) is proportional to N(t) (please make this leap now). Once you do, you can derive D(t) by normalizing N(t) (since it must be that $\int_0^{\infty}D(t)\, dt=1$). This gives you $D(t)=\lambda e^{-\lambda t}$.

For the sake of clarity, we offer an alternative explaination: Because D(t) is a probability distribution of lifetimes, the probability that a particle survives to an age $t_0$ is given by: $P_{Sur}(t_0)=\int_0^{\infty}D(t)\, dt$ Let us try to deduce the probability $P_{Sur}(t_0$) and then calculate D(t): If l dt is the approximate probability that a particle decays in time dt, then the chance that it survives is $1-\lambda\delta t$. So just as the chance of flipping $n$ consecutive heads is $.5^n$, the chance that the particle survives to time $t_0$ is approximately $(1-\lambda\delta t)^{\frac{t}{\delta t}}$. The approximation becomes perfect in the limit as $\delta t\rightarrow 0$, which gives $P_{Sur}(t)=\lim_{\delta t\rightarrow 0} (1-\lambda\delta t)^{\frac{t}{\delta t}}=e^{-\lambda t}$ (you may recall from freshman calculus that $\lim_{n\rightarrow \infty} (1+\frac{1}{n})^n=e$). Using this for $P_{Sur}(t_0)$ and differentiating:

$\frac{d}{dt}e^{-\lambda t}=\frac{d}{dt}\int_t^{\infty}D(t')\, dt'$ gives $-\lambda e^{-\lambda t}=-D(t)$, as before.

## **Links to Error Analysis Resources**

For Error Analysis, refer to:[ Error Analysis Exercise](https://berkeley-physics111b.github.io/EAX)
