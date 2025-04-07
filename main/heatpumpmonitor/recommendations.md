# Design Recommendations

- For high performance (SPF 4+) use a design flow temperature of 40C or below and ensure weather compensation settings have been set to match.

- Accurate heat loss calculations make designing for 40C design flow temperatures more practical and help avoid extreme (2-3x) over-sizing of heat pump units.

- When moving to more accurate heat loss calculations (e.g using blower door test results rather than pre-2000 CIBSE), carefully consider the following at the same time:
    - Reduce default design flow temperature from 45-50C to ideally 40C.

    - Add sufficient margin on heat pump capacity to cater for lower than manufacturer datasheet heat output during defrost conditions.

- Adding a reasonable margin (~1.2-1.5x) on an accurate heat loss seems to work fine for heat pumps that handle mild weather cycling well and may actually be preferable, especially given max output defrost issues.

- Spending time on commissioning and tuning heat pump settings to match real world heat loss makes a big difference to performance.

**General recommendations**

- Design for open loop with no zoning, TRV's on max or high temperature cutoff only.

- Try to minimise the amount of setback on heating schedules e.g keep daytime and nightime room target temperatures fairly close e.g 18-19C setback, 20C afternoon/evening.
