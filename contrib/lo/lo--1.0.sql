/* contrib/lo/lo--1.0.sql */

--
--	Create the data type ... now just a domain over OID
--

CREATE DOMAIN lo AS pg_catalog.oid;

--
-- For backwards compatibility, define a function named lo_oid.
--
-- The other functions that formerly existed are not needed because
-- the implicit casts between a domain and its underlying type handle them.
--
CREATE OR REPLACE FUNCTION lo_oid(lo) RETURNS pg_catalog.oid AS
'SELECT $1::pg_catalog.oid' LANGUAGE SQL STRICT IMMUTABLE;

-- This is used in triggers
CREATE OR REPLACE FUNCTION lo_manage()
RETURNS pg_catalog.trigger
AS 'MODULE_PATHNAME'
LANGUAGE C;