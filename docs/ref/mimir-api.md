# Mimir API Reference (Distilled)

> Source: `mimir-da` project. Use Mimir as a **validation source** — ask it a question in Vietnamese, get back SQL + data to cross-check against our direct BigQuery results.

## Base URLs

| Env | URL |
|-----|-----|
| Prod | `https://s.mservice.io/mimir-server-to-server` |
| Dev | `https://s.dev.mservice.io/mimir-server-to-server` |
| User | `son.pham9@mservice.com.vn` |

## Endpoints

### 1. List Domains
```bash
curl -s GET https://s.mservice.io/mimir-server-to-server/v1/domain/available
```

### 2. Domain Metadata
```bash
curl -s GET 'https://s.mservice.io/mimir-server-to-server/v1/domain/metadata?domain_id=DOMAIN_ID'
```

### 3. Send Question (async)
```bash
curl -s -X POST \
  "https://s.mservice.io/mimir-server-to-server/v1/domain/send_question" \
  -H 'Content-Type: application/json' \
  -d '{"user_email":"son.pham9@mservice.com.vn","domain_id":"DOMAIN_ID","question":"YOUR QUESTION"}'
```
Returns `{"data":{"request_id":"..."}}`

### 4. Get Answer (poll every 15s, up to 2 min)
```bash
curl -s 'https://s.mservice.io/mimir-server-to-server/v1/domain/get_answer?request_id=REQUEST_ID'
```

## Response Parsing

```python
ai_msg = [m for m in data['data']['messages'] if m['role'] == 'ai'][0]
parsed = json.loads(ai_msg['content'])
answer_text = parsed['content'][0]['text']['value']  # Vietnamese + HTML
for tool in parsed.get('tools_used', []):
    for call in tool.get('tool_calls', []):
        args = json.loads(call['function']['arguments'])
        sql = args.get('sql', '')
```

- Strip HTML (`<span style='color: green;'><b>value</b></span>`)
- Vietnamese number format: dots = thousand separators (`479.412` = 479,412)
- Ignore persona greetings ("Chao ban, minh la...")

## Question Format

Vietnamese. Always three parts:
```
{metric} {product/service} trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.
```

## Error Codes

| Code | Meaning | Action |
|------|---------|--------|
| 200 | Success | Parse response |
| 401 | "Mimir Session Token is required" | Infra issue — escalate, don't retry |

## When to Use Mimir (from this project)

We write SQL directly against BigQuery. Use Mimir to:
1. **Validate** — compare our SQL results against Mimir's answer for the same question
2. **Discover** — ask Mimir a question to learn which tables/columns it uses
3. **Schema discovery** — for domains with hidden schemas (like InsurTech), Mimir reveals column names through its generated SQL
