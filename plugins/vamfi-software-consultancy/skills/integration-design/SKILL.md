---
name: Integration Design
description: This skill should be used when the user asks to "design integrations", "create an API design", "define the event catalogue", "design the integration architecture", "document API contracts", "design the event-driven architecture", or needs to specify how systems communicate with each other.
version: 1.0.0
---

# Integration Design

Define precisely how systems, services, and third-party components communicate. Produce API contracts, event catalogues, and integration patterns that prevent the hidden coupling that breaks distributed systems.

## Overview

Integrations are the joints of a distributed system — they must be deliberately designed, not left to chance. This skill produces integration documentation that enables teams to develop services independently while meeting their integration contracts.

## Integration Pattern Selection

Select the appropriate pattern based on requirements:

| Pattern | Use When | Trade-offs |
|---|---|---|
| Synchronous REST | Response needed immediately, simple CRUD | Temporal coupling, cascading failures |
| Synchronous gRPC | High performance, typed contracts, streaming | More complex tooling |
| Async Messaging | Decoupling, resilience, event-driven | Eventual consistency, harder debugging |
| Event Sourcing | Audit trail required, temporal queries | Higher complexity, storage growth |
| File/Batch | High volume, periodic processing | Latency, error handling complexity |
| GraphQL | Flexible querying, multiple consumers | Caching complexity, over-fetching risk |

## API Contract Design

For each REST API, define:

```markdown
# API: [Service Name] v[N]

## Overview
Base URL: [URL pattern]
Authentication: [method — Bearer JWT, API Key, OAuth 2.0]
Rate limiting: [requests per minute/hour]
Versioning strategy: [URI / header / media type]

## Endpoints

### [Method] /[path]
**Purpose**: [what this endpoint does]
**Request**:
- Headers: [required headers]
- Path params: [name: type, description]
- Query params: [name: type, required/optional, description]
- Body: [JSON schema or example]

**Response**:
- 200: [description + example]
- 400: [validation error structure]
- 401: [authentication error]
- 404: [not found case]
- 500: [server error structure]

**Notes**: [idempotency, caching, side effects]
```

## Event Catalogue

For each domain event, define:

| Event Name | Producer | Consumers | Trigger | Payload Schema | Ordering | Retention |
|---|---|---|---|---|---|---|
| [OrderPlaced] | [order-service] | [inventory, notification] | [on order creation] | [schema ref] | [not required] | [7 days] |

Event payload structure:
```json
{
  "eventId": "uuid",
  "eventType": "OrderPlaced",
  "occurredAt": "ISO 8601 timestamp",
  "version": "1.0",
  "correlationId": "uuid",
  "data": {
    // domain-specific payload
  }
}
```

## Contract Testing Strategy

Define how integration contracts are validated:
- **Consumer-driven contract tests**: consumers define expected API behaviour (Pact framework)
- **Provider verification**: API providers run consumer contracts in CI
- **Schema validation**: event schemas validated against registry on publish

## Anti-Patterns to Flag

Flag any of these if present in the integration design:
- Shared databases between services (creates tight coupling)
- Synchronous chains longer than 2 hops (cascading failure risk)
- Events with no versioning strategy (breaking change risk)
- Missing idempotency on write endpoints (duplicate processing risk)

## Additional Resources

- **`references/integration-patterns.md`** — Detailed pattern descriptions with examples
- **`references/api-security.md`** — API security controls (auth, rate limiting, input validation)
