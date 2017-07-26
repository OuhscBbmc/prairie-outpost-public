### Column 1
* Zsolt's terminology: We may use campus "Clinical Data Repositories" or something similar. Data may move from various CDRs to the CDW. This will leave the door open for federated data access in the future (indexing, without moving data to the CDW), which I would not even bring up now.

### Column 2
* I'm not opposed to something like Django or Java if a proponent wants to discuss it; using these languages might mean using Postgres instead of SQL Server.  Also, there's no reason why all lanes in Ellis Island need to use the same language.  Two or three languages might provide more flexibility (to accommodate different data sources and team members) while still being a manageable code base.  We should consider using a functional language for the smaller data sources that are likely to change, and a strongly-typed/OO language for the more mature & stable datasources.  Perhaps only the metadata logging mechanism would need to be developed in duplication.

* Copying unnecessary rows is avoided.  Ideally the nightly operations copy only the new and modified records.  If the data source doesn't expose  record timestamps, additional mechanisms will need to be developed.  Less sophisticated data sources (which are less likely to contain timestamps than larger systems) may be small enough to copy every night.
