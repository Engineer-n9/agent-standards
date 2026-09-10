---
name: generic-data-analysis
description: Plan, execute, review, or report generic dataset analysis safely. Use for CSV, Excel, JSON, Parquet, databases, time series, statistics, correlations, regression, distributions, quality checks, and plots.
---

# Generic Data Analysis

Use with the consumer operating manual, local overlay, and applicable evidence/context safeguards. This skill governs general method and data safety; it never replaces domain expertise or a named human decision owner.

## Non-negotiable rules

- Treat inputs and outputs as potentially sensitive or proprietary; keep them within approved boundaries.
- Read sources without modifying them. Never overwrite a source, cache, or prior result.
- Do not silently infer consequential schema, unit, sign, time-base, coordinate, mapping, join, baseline, filter, reference, threshold, or missing-value meaning.
- Keep raw, validated, normalized, derived, and reported artifacts distinct.
- Distinguish observed facts, validated findings, derived results, assumptions, inferences, and recommendations.
- Do not use unverified source/context assumptions in a persistent contract or decision claim.

## Workflow

### 1. Frame

State decision/question, decision owner, population, unit of analysis, inclusion/exclusion criteria, intended outputs/CTQs, approved output boundary, sensitivity, and assumptions requiring confirmation. For consequential work, complete an approved analysis request and data contract.

### 2. Inventory and profile

For each source, record a path or sanitized identifier, format, size/hash when feasible, owner/scope/sensitivity, schema, keys, units, time base, coordinate/sign conventions, missingness, duplicates, ranges, and evidence status. Preview/profile before full transformation.

### 3. Validate before transform

Check parsing, types, identifiers, units, missing/non-finite values, ranges, ordering, sampling/repeated measurements, alignment, joins, interpolation/extrapolation, and population selection. Material ambiguity stops consequential work; exploratory output must be labeled provisional.

### 4. Make a reproducible recipe

Each run records source identities/hashes, selection criteria, mapping and units, transformations/filters/resampling/alignment/imputation/exclusions and parameters, method assumptions, output definitions, warnings, limitations, and approvals. Use a unique run identity. Label derived, filtered, interpolated, imputed, aligned, clamped, or extrapolated values.

### 5. Analyze in sequence

1. Describe counts, valid/excluded population, quality, units, central tendency, spread, and quantiles.
2. Visualize distributions, relationships, time-series raw versus processed views, groups, and diagnostics with units and processing labels.
3. Assess assumptions: distribution, outliers, dependence/autocorrelation, variance, model fit, applicability domain, and measurement quality.
4. Estimate/test with a method appropriate to the design; report effect size and uncertainty alongside significance.
5. Stress-test meaningful choices including filters, windows, mappings, alignment, exclusions, and reference selection.
6. Conclude only the framed question, separating observation, inference, and recommendation.

### 6. Review gate

Before a decision recommendation, confirm claim traceability, source preservation, visible quality flags/exclusions, parameterized figures, disclosed uncertainty/dependence/applicability limits, and sufficient provenance for independent reproduction.

## Statistical guardrails

- Correlation is association, not causation.
- Report sample size, method, effect size, uncertainty, outlier sensitivity, and dependence limitations.
- Do not inflate sample size with correlated time-series rows; use independent test/run/subject replication or a justified dependent-data method.
- Do not claim normality from visual impression alone.
- Preserve anomalies; document quality-based exclusions and their impact.
- For inclusive envelopes calculated from the same observed population, describe results as descriptive, not independent predictive validation. Stronger individual assessment needs leave-one-out/cross-validation or an externally defined, applicable reference corridor.

## Stop conditions

Stop for user direction or packet amendment if source ownership/classification is unclear; a material schema/unit/sign/time/reference/threshold is unverified; data must be mutated/uploaded/exported beyond boundary; a conclusion relies on unapproved interpolation/imputation/alignment/reference selection; incompatible context may be reused; or the request makes a causal, safety, quality, business, or operational decision beyond evidence.
