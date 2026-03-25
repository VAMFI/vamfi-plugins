---
name: Test Case Generation
description: This skill should be used when the user asks to "generate test cases", "write tests for this feature", "create test scenarios", "suggest edge cases", "generate unit tests", "write E2E tests", "create acceptance tests", or needs specific test cases for a story, endpoint, or module.
version: 1.0.0
---

# Test Case Generation

Generate comprehensive test cases covering happy paths, edge cases, boundary conditions, and security scenarios. Apply AI-generated edge case discovery to find scenarios the development team may not have considered.

## Overview

Test cases are the executable specification of system behaviour. This skill generates test cases that are specific, independent, and verifiable — not generic or overlapping.

## Test Case Generation Process

### Step 1: Identify Test Targets

From the story or requirement, identify:
- Functions/methods to unit test
- API endpoints to integration test
- User flows to E2E test
- Security surfaces to test (auth boundaries, input fields, file uploads)

### Step 2: Generate Test Cases by Type

#### Happy Path (Must have)
The expected successful flow. At least one test case per acceptance criterion.

#### Boundary Conditions (Must have)
For numeric inputs: test minimum, minimum-1, maximum, maximum+1, and zero.
For string inputs: test empty string, single character, maximum length, maximum+1 length.
For collections: test empty, single item, maximum items.

#### Negative Cases (Must have)
- Missing required fields
- Wrong data types
- Invalid formats (malformed email, invalid UUID, past date)
- Unauthorised access attempts

#### AI-Generated Edge Cases (Recommended)
Systematically consider:
- Concurrent operations: what if two users do this simultaneously?
- Race conditions: what if a dependency fails mid-operation?
- Large payloads: what if the input is much larger than expected?
- Unicode and special characters: emoji, RTL text, null bytes, SQL metacharacters
- Timezone edge cases: DST transitions, midnight, leap day
- Cascade effects: does this action trigger other actions that could conflict?

#### Security Test Cases
- Injection: `' OR 1=1; --` in string fields
- XSS: `<script>alert(1)</script>` in text fields
- IDOR: access another user's resource by guessing ID
- Auth bypass: access protected endpoint without token

### Step 3: Test Case Format

```markdown
# TC-[N]: [Short descriptive title]

**Type**: Unit | Integration | E2E | Security | Performance
**Priority**: P0 (critical) | P1 (high) | P2 (medium) | P3 (low)
**Story**: STORY-[N]

## Preconditions
[State that must be true before this test runs]

## Steps
1. [Action]
2. [Action]
3. [Expected result]

## Expected Result
[Specific, verifiable outcome]

## Test Data
[Specific values to use]

## Notes
[Any special considerations]
```

### Step 4: Test Case Table (Summary View)

| TC-ID | Title | Type | Priority | Story | Automated |
|---|---|---|---|---|---|
| TC-001 | Valid login with correct credentials | E2E | P0 | STORY-5 | Yes |
| TC-002 | Login with wrong password returns 401 | Integration | P0 | STORY-5 | Yes |
| TC-003 | Login with SQL injection in username | Security | P0 | STORY-5 | Yes |

## Property-Based Test Suggestions

For complex business logic, suggest property-based tests:
- "For any valid order, the total price must equal the sum of line item prices"
- "For any user with role Admin, all admin endpoints must return 200"
- "For any input that passes validation, processing must complete within 500ms"

## Additional Resources

- **`references/edge-case-patterns.md`** — Domain-specific edge case patterns
