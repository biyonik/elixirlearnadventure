# 🚀 Elixir Öğrenme Yol Haritası

**Mentor:** Claude AI  
**Öğrenci:** Ahmet ALTUN 
**Platform:** Windows  
**Başlangıç Tarihi:** 8 Temmuz 2025  

## 🎯 Kurs Hedefi

Bu kurs sonunda:
- Elixir'in temel paradigmalarını anlayacaksınız
- Concurrent ve fault-tolerant uygulamalar geliştirebileceksiniz
- Phoenix framework ile modern web uygulamaları yapabileceksiniz
- Production-ready Elixir uygulamaları deploy edebileceksiniz

---

## 📖 Seviye 1: Temel Kavramlar (2-3 hafta)

### Hafta 1-2: Syntax ve Pattern Matching

**🎓 Öğrenilecek Konular:**
- [ ] **Elixir Kurulumu (Windows)**
  - Elixir resmi installer ile kurulum
  - IEx (Interactive Elixir) kullanımı
  - VSCode + ElixirLS extension kurulumu
  
- [ ] **Temel Veri Tipleri**
  - `atom` - sabit değerler (:ok, :error, :hello)
  - `string` - metin verileri ("Hello World")
  - `number` - tam sayı ve ondalık (42, 3.14)
  - `list` - sıralı veri koleksiyonu [1, 2, 3]
  - `tuple` - sabit boyutlu veri grubu {1, 2, 3}
  - `map` - anahtar-değer çiftleri %{name: "John", age: 30}

- [ ] **Pattern Matching** ⭐ (Elixir'in süper gücü!)
  - Değişken atama vs pattern matching farkı
  - Destructuring (veri yapılarını parçalama)
  - Match operatörü (=) gerçek anlamı
  - Pin operatörü (^) kullanımı

- [ ] **Functions ve Modules**
  - Anonymous functions (fn -> end)
  - Named functions (def, defp)
  - Module yapısı ve organization
  - Function overloading

- [ ] **Pipe Operator |>**
  - Fonksiyonel programlamada veri akışı
  - Okunabilir kod yazma
  - Transformation chains

**📝 Pratik Ödevler:**
- [ ] IEx'te temel işlemler yapma
- [ ] Farklı veri tiplerini pattern match etme
- [ ] Basit fonksiyonlar yazma
- [ ] Pipe operator ile veri dönüşümleri

### Hafta 3: Immutability ve Recursion

**🎓 Öğrenilecek Konular:**
- [ ] **Immutable Data Structures**
  - Neden immutability? (Concurrency güvenliği)
  - Shared memory problemleri
  - Structural sharing nasıl çalışır?

- [ ] **Recursion ve Tail Recursion**
  - Recursive düşünce biçimi
  - Tail recursion optimization
  - Accumulator pattern

- [ ] **Enum Module**
  - `map/2` - transformation
  - `filter/2` - filtreleme
  - `reduce/3` - aggregation
  - `each/2` - side effects

- [ ] **Guards**
  - Function guards (when clauses)
  - Type checking
  - Custom guard functions

**🚀 İlk Proje: Hesap Makinesi**
- Temel matematiksel işlemler
- Pattern matching ile operator seçimi
- Error handling with atoms
- Recursive evaluation

**📚 Haftalık Hedef:** Temel Elixir syntax'ını rahatça kullanabilmek

---

## ⚡ Seviye 2: Concurrency Temelleri (3-4 hafta)

### Hafta 4-5: Processes

**🎓 Öğrenilecek Konular:**
- [ ] **Process Nedir?**
  - OS processes vs Elixir processes
  - Lightweight processes (milyonlarca!)
  - Isolated memory spaces

- [ ] **spawn/1 ve Process Yaratma**
  - `spawn/1` fonksiyonu
  - Process ID (PID) nedir?
  - Process lifecycle

- [ ] **Message Passing**
  - `send/2` fonksiyonu
  - Mailbox konsepti
  - Asynchronous communication

- [ ] **receive ve Mailbox**
  - `receive do` blocks
  - Pattern matching messages
  - Timeout handling

- [ ] **Process Monitoring**
  - `Process.monitor/1`
  - Process linking
  - Crash propagation

**🔧 Pratik Örnekler:**
- Basit message passing
- Counter process
- Process monitoring

### Hafta 6-7: GenServer

**🎓 Öğrenilecek Konular:**
- [ ] **OTP (Open Telecom Platform) Nedir?**
  - Battle-tested patterns
  - Supervision trees
  - Fault tolerance

- [ ] **GenServer Behavior**
  - State management
  - Synchronous vs Asynchronous calls
  - Client-server pattern

- [ ] **Callbacks**
  - `init/1` - initialization
  - `handle_call/3` - synchronous
  - `handle_cast/2` - asynchronous
  - `handle_info/2` - other messages

**🚀 İkinci Proje: Chat Room**
- Multiple users
- Message broadcasting
- State management
- Basic error handling

**📚 Haftalık Hedef:** Process-based concurrent programming anlayışı

---

## 🌐 Seviye 3: Web Development (4-5 hafta)

### Hafta 8-10: Phoenix Framework

**🎓 Öğrenilecek Konular:**
- [ ] **Phoenix Kurulumu**
  - Phoenix generator
  - Project structure
  - Development server

- [ ] **MVC Architecture**
  - Router - request routing
  - Controller - request handling
  - View - response rendering
  - Template - HTML generation

- [ ] **Templates (EEx)**
  - Embedded Elixir
  - Template inheritance
  - Helpers ve partials

- [ ] **Ecto (Database ORM)**
  - Schema definitions
  - Migrations
  - Queries
  - Changesets

**🔧 Windows Özel Notlar:**
- PostgreSQL kurulumu
- Phoenix development setup
- Environment variables

### Hafta 11-12: Real-time Features

**🎓 Öğrenilecek Konular:**
- [ ] **Phoenix Channels**
  - WebSocket connections
  - Channel routing
  - Topic subscriptions

- [ ] **Phoenix LiveView**
  - Server-side rendering
  - Real-time updates
  - Interactive components

**🚀 Ana Proje: Real-time Todo Uygulaması**
- User authentication
- Real-time updates
- Database persistence
- Modern UI

**📚 Haftalık Hedef:** Modern web uygulamaları geliştirebilmek

---

## 🏗️ Seviye 4: İleri Seviye (5-6 hafta)

### Hafta 13-15: OTP Derinlemesine

**🎓 Öğrenilecek Konular:**
- [ ] **Supervisor Trees**
  - Fault tolerance strategies
  - Restart policies
  - Supervision hierarchies

- [ ] **Application Behavior**
  - Application startup
  - Configuration management
  - Environment handling

- [ ] **Distribution**
  - Node connections
  - Distributed processes
  - Cluster management

### Hafta 16-18: Production

**🎓 Öğrenilecek Konular:**
- [ ] **Deployment**
  - Release building
  - Docker containers
  - Cloud deployment

- [ ] **Monitoring**
  - Telemetry
  - Metrics collection
  - Health checks

- [ ] **Performance Tuning**
  - Profiling tools
  - Memory optimization
  - Concurrency tuning

**🚀 Final Projesi: Distributed Chat Application**
- Multiple nodes
- Load balancing
- Fault tolerance
- Production deployment

---

## 📚 Önerilen Kaynaklar

### Kitaplar
1. **"Programming Elixir ≥ 1.6"** - Dave Thomas
   - Temel kavramlar için mükemmel
   - Praktik örnekler

2. **"Elixir in Action"** - Saša Jurić
   - Concurrent programming
   - OTP patterns

3. **"Programming Phoenix ≥ 1.4"** - Chris McCord
   - Web development
   - Real-time features

### Online Kaynaklar
- **Elixir Resmi Dokümantasyonu** - hexdocs.pm/elixir
- **Phoenix Guides** - phoenixframework.org/guides
- **Elixir School** - elixirschool.com (Türkçe mevcut!)
- **Exercism Elixir Track** - exercism.org/tracks/elixir

### YouTube Kanalları
- **ElixirConf** - konferans videoları
- **Elixir Streams** - canlı coding sessions

---

## 🎯 Haftalık Çalışma Programı

### Önerilen Çalışma Saatleri:
- **Pazartesi, Çarşamba, Cuma:** 1-1.5 saat teori + pratik
- **Cumartesi:** 2-3 saat proje çalışması
- **Pazar:** Code review ve proje planlama

### Haftalık Checkpoints:
1. **Teori testi** - anlayışı ölçme
2. **Pratik ödev** - kod yazma
3. **Proje milestone** - gerçek uygulama
4. **Mentor session** - sorular ve feedback

---

## 🤝 Mentorluk Sistemi

### Günlük Destek
- Sorularınızı hemen sorun
- Code review talepleri
- Debugging yardımı

### Haftalık Review
- Yazdığınız kodları inceleriz
- Best practices öğretimi
- Next week planning

### Proje Mentoring
- Proje planlama
- Architecture decisions
- Code organization

---

## 🏆 Başarı Kriterleri

### Seviye 1 Tamamlama:
- [ ] Pattern matching rahatça kullanabiliyorum
- [ ] Temel fonksiyonları yazabiliyorum
- [ ] Immutability konseptini anlıyorum

### Seviye 2 Tamamlama:
- [ ] Process-based programlama yapabiliyorum
- [ ] GenServer kullanabiliyorum
- [ ] Concurrent uygulamalar yazabiliyorum

### Seviye 3 Tamamlama:
- [ ] Phoenix ile web uygulamaları yapabiliyorum
- [ ] Database işlemleri yapabiliyorum
- [ ] Real-time features implement edebiliyorum

### Seviye 4 Tamamlama:
- [ ] Production-ready uygulamalar yazabiliyorum
- [ ] Distributed systems anlıyorum
- [ ] Performance optimization yapabiliyorum