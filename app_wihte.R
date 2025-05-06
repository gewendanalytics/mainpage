



library(shiny)
library(shinythemes)
library(shinyjs)
library(fontawesome)
library(waiter) # Yükleme animasyonu için

Sys.setlocale(locale = "Turkish")

translations <- list(
  tr = list(
    # Navbar
    "home" = "Ana Sayfa",
    "products" = "Ürünler",
    "solutions" = "Çözümler",
    "about" = "Hakkımızda",
    "contact" = "İletişim",
    "connect" = "BAĞLAN",
    
    # Ana sayfa
    "main_title" = "ProInsure Analytics",
    "main_subtitle" = "Future-Proof Actuarial Intelligence",
    
    "slide1_title" = "Aktüeryal Mükemmellik",
    "slide1_subtitle" = "Gelişmiş Hesaplama Teknolojisi",
    "slide1_text" = "Aktüeryal analiz ve hesaplamalarda devrim yaratıyoruz.",
    
    "slide2_title" = "Yapay Zeka Destekli Analitik",
    "slide2_subtitle" = "Veri Odaklı İş Modelleri",
    "slide2_text" = "Yapay zeka ile riskleri analiz edin ve stratejilerinizi optimize edin.",
    
    "slide3_title" = "Risk Yönetimi ve Tahminleme",
    "slide3_subtitle" = "İleri Seviye Tahmin Modelleri",
    "slide3_text" = "Riski öngörün, tahminleyin ve yönetin.",
    
    # Ürünler sayfası
    "products_title" = "Ürünlerimiz",
    "demo_title" = "ProInsure için tasarlandı.",
    "demo_subtitle" = "Kişisel, güvenli ve güçlü.",
    
    # Kategori isimleri
    "cat_actuarial" = "Aktüeryal Mükemmellik",
    "cat_ai" = "Yapay Zeka Analitikleri",
    "cat_risk" = "Risk Yönetimi",
    "cat_predictive" = "Tahminleme Modelleri",
    "cat_data" = "Veri Entegrasyonu",
    "cat_financial" = "Finansal Raporlama",
    
    "product1_title" = "Maluliyet&Destek Hesaplaması",
    "product1_desc" = "Maluliyet ve Destek tazminatı hesaplamaları",
    "product1_price" = "42.999 TL",
    
    "product2_title" = "Yaşam Tabloları Etki Analizi",
    "product2_desc" = "Yaşam Tablolarının tazminata etkileri",
    "product2_price" = "32.999 TL",
    
    # Buton metni
    "buy_button" = "Satın Al",
    "learn_more" = "Daha Fazla",
    
    # Hakkımızda sayfası
    "about_title" = "Hakkımızda",
    "about_who" = "Biz Kimiz?",
    "about_who_text1" = "ProInsure olarak, sigorta ve aktüeryal alanda devrim yaratan teknolojiler geliştiriyoruz. İleri analitik, yapay zeka ve veri bilimi uzmanlığımızla, sigorta şirketlerine geleceğe hazır çözümler sunuyoruz.",
    "about_who_text2" = "Ekibimiz, aktüeryal bilimi en son teknolojilerle harmanlayarak, sektördeki en yenilikçi araçları geliştiriyor ve müşterilerimizin rekabet avantajı kazanmasını sağlıyor.",
    "about_mission" = "Misyonumuz",
    "about_mission_text" = "Sigorta endüstrisinin karmaşık veri sorunlarını çözerek, daha akıllı kararlar almanızı sağlamak. Veri odaklı çözümlerimizle risk değerlendirmesini ve finansal planlama süreçlerini dönüştürüyoruz.",
    "about_values" = "Değerlerimiz",
    "about_values_text" = "İnovasyon, kesinlik ve müşteri odaklılık. Bu değerlerimiz doğrultusunda, sürekli gelişen teknolojimiz ve uzman kadromuzla sigorta sektörüne öncülük etmeye devam ediyoruz.",
    "about_vision" = "Vizyonumuz",
    "about_vision_text" = "Aktüeryal analitikte yapay zeka çağını başlatarak, sigorta sektörünün geleceğini şekillendirmek. ProInsure ile, risk tahmininden tazminat hesaplamalarına kadar tüm süreçleri yeniden tanımlıyoruz.",
    
    # İletişim sayfası
    "contact_title" = "Bize Ulaşın",
    "contact_form_title" = "Mesaj Gönderin",
    "contact_name" = "Adınız",
    "contact_email" = "Email",
    "contact_subject" = "Konu",
    "contact_message" = "Mesajınız",
    "contact_submit" = "Gönder",
    "contact_success" = "Teşekkürler! Mesajınız bize ulaştı. En kısa sürede size dönüş yapacağız.",
    "contact_close" = "Tamam",
    
    "subject_general" = "Genel Bilgi",
    "subject_support" = "Ürün Desteği",
    "subject_sales" = "Satış",
    "subject_other" = "Diğer",
    
    "address_title" = "Adres",
    "address1" = "Örnek Sokak No:123",
    "address2" = "Kadıköy, İstanbul, Türkiye",
    
    "email_title" = "Email",
    "email1" = "info@proinsure.com",
    "email2" = "support@proinsure.com",
    
    "phone_title" = "Telefon",
    "phone1" = "+90 212 123 45 67",
    "phone2" = "+90 212 123 45 68",
    
    "hours_title" = "Çalışma Saatleri",
    "hours1" = "Pazartesi - Cuma: 09:00 - 18:00",
    "hours2" = "Cumartesi: 10:00 - 15:00"
  ),
  
  en = list(
    # Navbar
    "home" = "Home",
    "products" = "Products",
    "solutions" = "Solutions",
    "about" = "About Us",
    "contact" = "Contact",
    "connect" = "CONNECT",
    
    # Ana sayfa
    "main_title" = "ProInsure Analytics",
    "main_subtitle" = "Future-Proof Actuarial Intelligence",
    
    "slide1_title" = "Actuarial Excellence",
    "slide1_subtitle" = "Advanced Calculation Technology",
    "slide1_text" = "Revolutionizing actuarial analysis and calculations.",
    
    "slide2_title" = "AI-Powered Analytics",
    "slide2_subtitle" = "Data-Driven Business Models",
    "slide2_text" = "Analyze risks and optimize your strategies with artificial intelligence.",
    
    "slide3_title" = "Risk Management & Forecasting",
    "slide3_subtitle" = "Advanced Prediction Models",
    "slide3_text" = "Predict, forecast, and manage risk.",
    
    # Ürünler sayfası
    "products_title" = "Our Products",
    "demo_title" = "Designed for ProInsure.",
    "demo_subtitle" = "Personal, secure, and powerful.",
    
    # Kategori isimleri
    "cat_actuarial" = "Actuarial Excellence",
    "cat_ai" = "AI-Powered Analytics",
    "cat_risk" = "Risk Management",
    "cat_predictive" = "Predictive Modeling",
    "cat_data" = "Data Integration",
    "cat_financial" = "Financial Reporting",
    
    "product1_title" = "Disability & Support Calculation",
    "product1_desc" = "Disability and Support compensation calculations",
    "product1_price" = "$1,499",
    
    "product2_title" = "Life Tables Impact Analysis",
    "product2_desc" = "Effects of Life Tables on compensation",
    "product2_price" = "$1,199",
    
    # Buton metni
    "buy_button" = "Buy Now",
    "learn_more" = "Learn More",
    
    # Hakkımızda sayfası
    "about_title" = "About Us",
    "about_who" = "Who We Are",
    "about_who_text1" = "At ProInsure, we develop revolutionary technologies in the insurance and actuarial field. With our expertise in advanced analytics, artificial intelligence, and data science, we provide future-ready solutions to insurance companies.",
    "about_who_text2" = "Our team combines actuarial science with the latest technologies, developing the most innovative tools in the industry and helping our customers gain a competitive advantage.",
    "about_mission" = "Our Mission",
    "about_mission_text" = "To solve the complex data problems of the insurance industry, enabling you to make smarter decisions. We transform risk assessment and financial planning processes with our data-driven solutions.",
    "about_values" = "Our Values",
    "about_values_text" = "Innovation, precision, and customer focus. In line with these values, we continue to lead the insurance industry with our continuously evolving technology and expert staff.",
    "about_vision" = "Our Vision",
    "about_vision_text" = "To shape the future of the insurance industry by initiating the age of artificial intelligence in actuarial analytics. With ProInsure, we are redefining all processes from risk prediction to compensation calculations.",
    
    # İletişim sayfası
    "contact_title" = "Contact Us",
    "contact_form_title" = "Send a Message",
    "contact_name" = "Your Name",
    "contact_email" = "Email",
    "contact_subject" = "Subject",
    "contact_message" = "Your Message",
    "contact_submit" = "Submit",
    "contact_success" = "Thank you! Your message has been received. We will get back to you as soon as possible.",
    "contact_close" = "Close",
    
    "subject_general" = "General Information",
    "subject_support" = "Product Support",
    "subject_sales" = "Sales",
    "subject_other" = "Other",
    
    "address_title" = "Address",
    "address1" = "Example Street No:123",
    "address2" = "Kadikoy, Istanbul, Turkey",
    
    "email_title" = "Email",
    "email1" = "info@proinsure.com",
    "email2" = "support@proinsure.com",
    
    "phone_title" = "Phone",
    "phone1" = "+90 212 123 45 67",
    "phone2" = "+90 212 123 45 68",
    
    "hours_title" = "Working Hours",
    "hours1" = "Monday - Friday: 09:00 - 18:00",
    "hours2" = "Saturday: 10:00 - 15:00"
  )
)


product_data <- list(
  "cat_actuarial" = list(
    list(name="ActuSense Pro", icon="chart-line", desc="Gelişmiş aktüeryal hesaplama motoru"),
    list(name="ActuRisk Analyzer", icon="shield-alt", desc="Risk analizi ve modelleme aracı"),
    list(name="ActuDynamics Suite", icon="project-diagram", desc="Entegre aktüeryal çözüm paketi")
  ),
  "cat_ai" = list(
    list(name="PredictAI", icon="brain", desc="Yapay zeka destekli tahmin motoru"),
    list(name="Analytics Fusion", icon="layer-group", desc="Çok katmanlı analitik platform"),
    list(name="DecisionLab AI", icon="lightbulb", desc="Karar destek sistemi")
  ),
  "cat_risk" = list(
    list(name="RiskMatrix", icon="table", desc="Risk matrisi oluşturma aracı"),
    list(name="RiskShield", icon="shield-alt", desc="Risk yönetimi koruma sistemi"),
    list(name="RiskNavigator", icon="compass", desc="Risk keşif ve izleme platformu")
  ),
  "cat_predictive" = list(
    list(name="ForecastMaster", icon="chart-line", desc="Gelişmiş tahminleme aracı"),
    list(name="PredictX", icon="calculator", desc="Matematiksel öngörü modeli"),
    list(name="TrendSpotter", icon="search", desc="Eğilim analizi ve tespit sistemi")
  ),
  "cat_data" = list(
    list(name="DataMerge Pro", icon="object-group", desc="Veri birleştirme çözümü"),
    list(name="ConnectX", icon="plug", desc="Veri kaynağı bağlama sistemi"),
    list(name="IntegrateHub", icon="network-wired", desc="Merkezi veri entegrasyon platformu")
  ),
  "cat_financial" = list(
    list(name="IFRS Reports", icon="file-invoice", desc="IFRS standartları raporlama aracı"),
    list(name="SolvencyTrack", icon="tasks", desc="Solvency II uyum platformu"),
    list(name="FinancePulse", icon="chart-bar", desc="Finansal metrik izleme sistemi")
  )
)

# UI ----

ui <- fluidPage(
  theme = shinytheme("flatly"),
  useShinyjs(),
  
  # Yükleme ekranı
  use_waiter(),
  waiter_show_on_load(
    html = tagList(
      spin_cube_grid(),
      h3("ProInsure Analytics yükleniyor...", style = "color: white; margin-top: 20px;")
    ),
    color = "#000814"
  ),
  
  # UI başlangıcında yüklendikten hemen sonra başlık ve alt başlığı görünür hale getir
  tags$script(HTML("
  $(document).ready(function() {
    // Başlık ve alt başlığı hemen görünür yap
    $('#central-title, #central-subtitle, #scrolling-divs-container').css({
      'opacity': '1',
      'visibility': 'visible'
    });
    
    // Yükleme ekranını hızlıca kaldır
    $('.waiter-overlay').fadeOut(50);
  });
")),
  
  # CSS ve JavaScript
  tags$head(
    # Fontları yükle
    tags$link(href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap", rel = "stylesheet"),
    
    # FontAwesome
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"),
    
    # CSS Stilleri
    tags$style(HTML("
body { 
  background-color: #ffffff; 
  color: #333;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; 
  margin: 0; 
  padding: 0;
  scroll-behavior: smooth;
  overflow-y: auto;
  padding-top: 80px;
}

#canvas-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}

/* Navbar stili */
.navbar {
  background-color: rgba(255, 255, 255, 0.9) !important;
  border: none !important;
  margin-bottom: 0 !important;
  padding: 15px 0;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  position: fixed !important;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  z-index: 1000;
  transition: all 0.3s ease;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar-default .navbar-brand {
  color: #0077cc !important;
  font-weight: 500;
  font-size: 24px;
}

/* Navbar hover ve aktif stiller */
.navbar-default .navbar-nav > li > a {
  color: rgba(0, 0, 0, 0.7) !important;
  font-weight: 500;
  padding: 15px 20px;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: all 0.3s ease;
  position: relative;
}

.navbar-default .navbar-nav > li > a:hover {
  color: #0077cc !important;
  background-color: transparent !important;
}

.navbar-default .navbar-nav > li > a:hover::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: #0077cc;
}

.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:focus,
.navbar-default .navbar-nav > .active > a:hover {
  background-color: rgba(0, 119, 204, 0.1) !important;
  color: #0077cc !important;
  position: relative;
}

.navbar-default .navbar-nav > .active > a::after,
.navbar-default .navbar-nav > .active > a:focus::after,
.navbar-default .navbar-nav > .active > a:hover::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 3px;
  background-color: #0077cc;
}

/* Dil değiştirme butonu */
.lang-btn {
  background: linear-gradient(to right, #00ccff, #ff2975);
  color: white;
  border: none;
  border-radius: 30px;
  padding: 5px 15px;
  margin-top: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-left: 10px;
}

.lang-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
}

.navbar-right .btn {
  margin-top: 8px;
  background: linear-gradient(to right, #00ccff, #ff2975);
  color: #fff;
  border: none;
  padding: 8px 20px;
  border-radius: 30px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.navbar-right .btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 204, 255, 0.5);
}

/* Ana ekran merkez başlıklar - DOĞRUDAN GÖRÜNÜR OLMALARI İÇİN DEĞİŞİKLİK */
#central-title {
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 96px;
  font-weight: 800;
  font-family: 'Inter', sans-serif;
  text-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  z-index: 5;
  text-align: center;
  animation: float 6s ease-in-out infinite, shine 3s ease-in-out infinite;
  opacity: 1 !important;
  visibility: visible !important;
  display: block !important;
  color: #333;
}

#central-subtitle {
  position: absolute;
  top: 52%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(90deg, #00c6ff, #7b3fe4, #ff2975, #ff8d3f); 
  -webkit-background-clip: text; 
  -webkit-text-fill-color: transparent; 
  background-clip: text;
  text-fill-color: transparent;
  display: inline-block;
  text-shadow: 0 0 15px rgba(0, 198, 255, 0.5), 0 0 25px rgba(123, 63, 228, 0.3), 0 0 35px rgba(255, 41, 117, 0.3), 0 0 45px rgba(255, 141, 63, 0.3);
  font-size: 52px;
  font-weight: 300;
  font-family: 'Inter', sans-serif;
  z-index: 5;
  text-align: center;
  letter-spacing: 2px;
  animation: float 6s ease-in-out infinite reverse, shine 3s ease-in-out infinite;
  opacity: 1 !important;
  visibility: visible !important;
  display: block !important; /* Bu satırı ekleyin */
}

/* Sağdaki divler - Sadece ana sayfada gösterilecek */
#scrolling-divs-container {
  position: fixed;
  top: 0;
  right: 0;
  width: 0; /* Ana sayfa dışında hiç yer kaplamasın */
  height: 100vh;
  overflow-y: auto;
  padding: 80px 0 20px 0;
  z-index: 5;
  scrollbar-width: thin;
  scrollbar-color: rgba(0, 204, 255, 0.5) rgba(0, 8, 20, 0.3);
  background-color: rgba(0, 8, 20, 0.3);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  opacity: 1 !important;
  visibility: visible !important;
  display: none; /* Varsayılan olarak gizli */
}

/* Sadece ana sayfada sağdaki divleri göster */
body.home #scrolling-divs-container {
  display: block;
  width: 15%;
}

.special-letter-g {
  color: #0077cc;
  text-shadow: 0 0 30px rgba(0, 119, 204, 0.3);
}

.special-letter-e {
  color: #e91e63;
  text-shadow: 0 0 30px rgba(233, 30, 99, 0.3);
}

.regular-letter {
  color: #333333;
}

/* Animasyonları biraz daha hafif yapalım */
@keyframes float {
  0% {
    transform: translate(-50%, -50%);
  }
  50% {
    transform: translate(-50%, -53%); /* -55% yerine -53% */
  }
  100% {
    transform: translate(-50%, -50%);
  }
}

/* Hafif ışıltı animasyonu ekleyelim */
@keyframes shine {
  0% {
    text-shadow: 0 0 30px rgba(255, 255, 255, 0.5);
  }
  50% {
    text-shadow: 0 0 40px rgba(255, 255, 255, 0.7);
  }
  100% {
    text-shadow: 0 0 30px rgba(255, 255, 255, 0.5);
  }
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-20px);
  }
  60% {
    transform: translateY(-10px);
  }
}

/* Sağdaki ürün kartları */
#scrolling-divs-container::-webkit-scrollbar {
  width: 6px;
}

#scrolling-divs-container::-webkit-scrollbar-track {
  background: rgba(0, 8, 20, 0.3);
}

#scrolling-divs-container::-webkit-scrollbar-thumb {
  background-color: rgba(0, 204, 255, 0.5);
  border-radius: 10px;
}

.info-card {
  background-color: #f5f9fc;
  border-left: 3px solid #0077cc;
  margin: 15px;
  padding: 20px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
  cursor: pointer;
  border-radius: 12px;
  position: relative;
}

.info-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 20px rgba(0, 119, 204, 0.15);
  border-left: 3px solid #e91e63;
}

.info-card h3 {
  color: #0077cc;
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 10px;
}

.info-card p {
  color: #555;
  font-size: 14px;
  margin-bottom: 15px;
}

.info-card img {
  width: 100%;
  height: auto;
  border-radius: 8px;
  margin-top: 10px;
  border: 1px solid rgba(0, 204, 255, 0.3);
}

/* Popup ürünler */
.products-popup-vertical {
  display: flex;
  flex-direction: column;
  position: absolute;
  left: -220px;
  top: 50%;
  transform: translateY(-50%);
  z-index: 100;
}

.product-popup-vertical {
  min-width: 180px;
  margin: 7px 0;
  background: linear-gradient(90deg, #00ccff 60%, #ff2975 120%);
  color: white;
  font-size: 15px;
  font-weight: 500;
  padding: 12px 15px;
  border-radius: 8px;
  box-shadow: 0 2px 16px rgba(0,204,255,0.12);
  transition: background 0.2s, color 0.2s, opacity 0.22s, transform 0.22s;
  cursor: pointer;
  opacity: 0;
  pointer-events: none;
  transform: translateY(-10px);
  border-left: 4px solid #ff2975;
  border-right: 4px solid #ff2975;
  white-space: nowrap;
  display: flex; 
  align-items: center;
}

.product-popup-vertical i {
  font-size: 18px; 
  margin-right: 8px; 
  color: #fffbe7;
}

.info-card.show-popup .product-popup-vertical {
  opacity: 1;
  pointer-events: initial;
  transform: translateY(0);
}

/* Slider bölümü */
.slider-container { 
  position: relative; 
  width: 100%; 
  overflow: visible;
  height: auto;
  min-height: 600px;
  margin-top: 60px;
  margin-bottom: 60px;
  padding-top: 40px;
}

.horizontal-slider {
  display: flex;
  overflow-x: auto;
  scroll-behavior: smooth;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
  padding: 0;
  height: auto;
  min-height: 500px;
}

.horizontal-slider::-webkit-scrollbar { display: none; }

.slide {
  flex: 0 0 100%;
  min-width: 50%;
  scroll-snap-align: center;
  padding: 0;
  height: 75%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slide-content {
  display: flex;
  align-items: center;
  width: 70%;
  height: 75%;
  background-color: #ffffff;
  border-radius: 16px;
  padding: 40px;
  box-sizing: border-box;
  transition: all 0.5s ease;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  position: relative;
  overflow: hidden;
  margin: 0 auto;
  border: 1px solid #eaeaea;
}

/* Fare üzerine gelince animasyon */
.slide-content:hover {
  transform: scale(1.02);
  box-shadow: 0 15px 40px rgba(0, 204, 255, 0.2);
}

/* Işık efekti */
.slide-content::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 60%);
  opacity: 0;
  transform: scale(0.5);
  transition: opacity 0.5s, transform 0.5s;
  pointer-events: none;
}

.slide-content:hover::before {
  opacity: 1;
  transform: scale(1);
}

.slide-text { 
  flex: 1; 
  padding-right: 60px;
  transition: transform 0.4s ease;
}

.slide-content:hover .slide-text {
  transform: translateY(-5px);
}

.slide-text h2 { 
  font-size: 48px; 
  margin-bottom: 20px;
  line-height: 1.2;
  transition: color 0.3s ease;
  color: #0077cc;
}

.slide-content:hover .slide-text h2 {
  color: #e91e63;
}

.slide-text h3 { 
  font-size: 36px; 
  color: #555; 
  margin-bottom: 30px;
  line-height: 1.2;
  transition: color 0.3s ease;
}

.slide-content:hover .slide-text h3 {
  color: #777;
}

.slide-text p {
  font-size: 20px;
  line-height: 1.6;
  color: #333;
}

.slide-image { 
  flex: 1; 
  display: flex; 
  justify-content: center;
  align-items: center;
  height: 100%;
  transition: transform 0.5s ease;
  overflow: hidden;
}

.slide-content:hover .slide-image {
  transform: translateY(-5px) scale(1.05);
}

.slide-image img { 
  max-width: 100%; 
  max-height: 100%;
  border-radius: 12px;
  object-fit: contain;
  transition: filter 0.5s ease, box-shadow 0.5s ease;
}

.slide-content:hover .slide-image img {
  filter: brightness(1.1);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

/* Video stili */
.slide-image video { 
  max-width: 100%; 
  max-height: 100%;
  border-radius: 12px;
  object-fit: contain;
  transition: filter 0.5s ease, box-shadow 0.5s ease;
}

.slide-content:hover .slide-image video {
  filter: brightness(1.1);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

/* Kaydırma butonları stili */
.nav-button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(0, 8, 20, 0.7);
  color: #fff;
  border: none;
  width: 60px; 
  height: 60px; 
  border-radius: 50%;
  font-size: 24px;
  cursor: pointer;
  z-index: 10;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.nav-button:hover {
  background: rgba(0, 204, 255, 0.3);
  transform: translateY(-50%) scale(1.1);
  box-shadow: 0 0 20px rgba(0, 204, 255, 0.3);
}

.prev { left: 40px; }
.next { right: 40px; }

/* Degrade çizgi efekti */
.slide-content::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background: linear-gradient(to right, #00ccff, #ff2975);
  transition: width 0.5s ease;
}

.slide-content:hover::after {
  width: 100%;
}

/* Appimize video container */
.appimize-container {
  width: 100%;
  max-width: 1400px; /* 1200px yerine daha geniş */
  margin: 40px auto;
  position: relative;
  border-radius: 18px;
  overflow: hidden;
  background-color: #000;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
}

.appimize-frame {
  position: relative;
  padding-top: 56.25%; /* 16:9 en boy oranı */
  overflow: hidden;
  border-radius: 16px;
  border: 2px solid rgba(0, 204, 255, 0.2);
}

.appimize-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.appimize-header {
  position: absolute;
  top: 30px;
  left: 30px;
  z-index: 5;
  max-width: 80%;
}

.appimize-title {
  color: white;
  font-size: 32px;
  font-weight: 700;
  margin: 0;
  line-height: 1.2;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

.appimize-subtitle {
  color: rgba(255, 255, 255, 0.8);
  font-size: 24px;
  font-weight: 500;
  margin: 10px 0 0 0;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

.appimize-controls {
  position: absolute;
  bottom: 20px;
  left: 0;
  right: 0;
  display: flex;
  justify-content: center;
  gap: 10px;
  z-index: 5;
}

.control-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.3);
  transition: all 0.3s ease;
}

.control-dot.active {
  background-color: rgba(255, 255, 255, 0.9);
  width: 30px;
  border-radius: 4px;
}

.refresh-button {
  position: absolute;
  bottom: 20px;
  right: 20px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: rgba(0, 204, 255, 0.2);
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 18px;
  cursor: pointer;
  transition: all 0.3s ease;
  z-index: 5;
}

.refresh-button:hover {
  background-color: rgba(0, 204, 255, 0.4);
  transform: rotate(45deg);
}

/* İçerik sayfaları */
.content-page {
  padding: 80px 0; /* Yanlardaki padding'i kaldırdık */
  min-height: 100vh;
  background-color: rgba(0, 8, 20, 0.5);
  width: 100%;
}

.page-container {
  max-width: 1600px; /* Daha geniş maksimum genişlik */
  width: 90%; /* Sayfanın %90'ını kapla */
  margin: 0 auto; /* Otomatik ortalama */
  padding: 0 30px; /* Yanlarda boşluk */
}

.page-title {
  font-size: 42px;
  margin-bottom: 40px;
  text-align: center;
  position: relative;
  padding-bottom: 15px;
}

.page-title::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 3px;
  background: linear-gradient(to right, #00ccff, #ff2975);
}

/* Ürünler sayfası */
.products-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding: 40px 0; /* Yanlardaki padding'i kaldırdık */
  gap: 30px; /* Aralığı artırdık */
  width: 100%;
}

.product-category {
  width: calc(33.33% - 30px); /* 3 kolon, 30px boşluk */
  min-width: 350px; /* Minimum genişliği artırdık */
  background-color: rgba(0, 8, 20, 0.7);
  border-radius: 12px;
  padding: 25px; /* İç boşluğu artırdık */
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
  border-top: 3px solid #00ccff;
  transition: all 0.3s ease;
  margin-bottom: 25px; /* Alt boşluğu artırdık */
}

.product-category h2 {
  color: #00ccff;
  font-size: 24px; /* Başlık boyutunu artırdık */
  margin-bottom: 20px; /* Alt boşluğu artırdık */
  text-align: center;
  padding-bottom: 12px; /* Alt padding'i artırdık */
  border-bottom: 1px solid rgba(0, 204, 255, 0.2);
}

.product-list {
  display: flex; 
  flex-wrap: wrap; 
  gap: 15px; /* Aralığı artırdık */ 
  justify-content: center;
}

.product-item {
  display: flex; 
  align-items: center;
  background: rgba(0,204,255,0.09);
  color: #fff;
  border-radius: 7px;
  min-width: 130px; /* Genişliği artırdık */
  font-size: 15px; /* Font boyutunu artırdık */
  padding: 10px 15px; /* Padding'i artırdık */
  margin: 3px 0;
  transition: background .18s;
  border-left: 2px solid #ff2975;
  border-right: 2px solid #ff2975;
}

.product-item:hover { 
  background: rgba(255,41,117,0.14);
}

.product-item i { 
  font-size: 18px; /* İkon boyutunu artırdık */
  margin-right: 10px; /* Sağ boşluğu artırdık */
  color: #00ccff;
}

/* Öne Çıkan Özellikler için hover efekti */
.feature-box:hover {
  transform: translateY(-10px);
  box-shadow: 0 10px 25px rgba(0, 204, 255, 0.2);
}


.feature-box {
  background: #f5f9fc !important;
  border-top: 3px solid #0077cc;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.feature-box h3 {
  color: #333 !important;
}

.feature-box p {
  color: #666 !important;
}

.product-category {
  background-color: #f5f9fc;
  border-top: 3px solid #0077cc;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.product-category h2 {
  color: #0077cc;
  border-bottom: 1px solid rgba(0, 119, 204, 0.2);
}


.feature-active {
  transform: translateY(-10px) scale(1.05);
  box-shadow: 0 10px 30px rgba(0, 204, 255, 0.3);
}

/* Klasik ürün kartları */
.product-card {
  background-color: #ffffff;
  border-radius: 12px;
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
  position: relative;
  margin-bottom: 30px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
  border: 1px solid #eaeaea;
}

.product-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 204, 255, 0.2);
}

.product-card::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0) 70%);
  opacity: 0;
  transform: scale(0.5);
  transition: opacity 0.5s, transform 0.5s;
  pointer-events: none;
  z-index: 1;
}

.product-card:hover::before {
  opacity: 1;
  transform: scale(1);
}

.product-image {
  height: 250px; /* Yüksekliği artırdık */
  overflow: hidden;
}

.product-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.product-card:hover .product-image img {
  transform: scale(1.1);
}

.product-details {
  padding: 25px; /* İç boşluğu artırdık */
  transition: transform 0.3s ease;
}

.product-card:hover .product-details {
  transform: translateY(-5px);
}

.product-title {
  font-size: 22px;
  margin-bottom: 15px;
  color: #333;
  transition: color 0.3s ease;
}

.product-card:hover .product-title {
  color: #0077cc;
}

.product-desc {
  color: #666;
  margin-bottom: 20px;
  font-size: 16px;
  line-height: 1.5;
}

.product-price {
  font-size: 28px;
  font-weight: 600;
  color: #0077cc;
  transition: color 0.3s ease;
}

.product-card:hover .product-price {
  color: #e91e63;
}

.product-card::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background: linear-gradient(to right, #00ccff, #ff2975);
  transition: width 0.5s ease;
}

.product-card:hover::after {
  width: 100%;
}

.product-btn {
  display: block;
  width: 100%;
  background: linear-gradient(to right, #00ccff, #ff2975);
  color: white !important;
  border: none;
  padding: 12px 0; /* Padding'i artırdık */
  border-radius: 30px;
  margin-top: 20px; /* Üst boşluğu artırdık */
  font-weight: 500;
  font-size: 16px;
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 1px;
  opacity: 0.9;
  transform: translateY(0);
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product-card:hover .product-btn {
  opacity: 1;
  transform: translateY(-5px);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}

/* Hakkımızda sayfası */
.about-section {
  display: flex;
  gap: 40px;
  margin-bottom: 60px;
  background-color: #f5f9fc;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  border-radius: 16px;
  padding: 40px; /* İç boşluğu artırdık */
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  width: 100%;
}

.about-section h2, .about-section h3 {
  color: #0077cc;
}

.about-section p {
  color: #555;
}

.contact-form {
  background-color: #f5f9fc;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.info-item {
  background-color: #f5f9fc;
  border-left: 3px solid #0077cc;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.info-title {
  color: #0077cc;
}

.form-control {
  background-color: #ffffff;
  border: 1px solid #e1e1e1;
  color: #333;
}

.about-text {
  flex: 1;
}

.about-image {
  flex: 1;
  border-radius: 10px;
  overflow: hidden;
}

.about-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.about-section:hover .about-image img {
  transform: scale(1.05);
}

/* İletişim sayfası */
.contact-container {
  display: flex;
  gap: 50px; /* Aralığı artırdık */
  width: 100%;
}

.contact-form {
  flex: 1;
  background-color: rgba(0, 8, 20, 0.7);
  padding: 40px; /* İç boşluğu artırdık */
  border-radius: 16px;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

.contact-info {
  flex: 1;
}

.info-item {
  margin-bottom: 30px;
  background-color: rgba(0, 8, 20, 0.7);
  padding: 25px; /* İç boşluğu artırdık */
  border-radius: 12px;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border-left: 3px solid #00ccff;
  transition: all 0.3s ease;
}

.info-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  border-left: 3px solid #ff2975;
}

.info-title {
  font-size: 22px; /* Başlık boyutunu artırdık */
  margin-bottom: 15px; /* Alt boşluğu artırdık */
  color: #00ccff;
}

.form-group {
  margin-bottom: 25px; /* Alt boşluğu artırdık */
}

.form-control {
  background-color: #ffffff;
  border: 1px solid #e1e1e1;
  color: #333;
  padding: 15px; /* İç boşluğu artırdık */
  border-radius: 8px;
  width: 100%; /* Genişliği %100 yaptık */
  font-size: 16px; /* Font boyutunu artırdık */
}

.form-control:focus {
  box-shadow: 0 0 0 2px rgba(0, 119, 204, 0.3);
  border-color: #0077cc;
}

.btn-submit {
  background: linear-gradient(to right, #0077cc, #e91e63);
  color: #fff;
  border: none;
  padding: 15px 35px; /* Padding'i artırdık */
  border-radius: 30px;
  font-weight: 600;
  font-size: 16px; /* Font boyutunu artırdık */
  cursor: pointer;
  transition: all 0.3s;
  text-transform: uppercase;
  letter-spacing: 1px;
  display: block; /* Blok element yaptık */
  margin: 0 auto; /* Otomatik ortalama */
}

.btn-submit:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

/* Ana içerik ve animasyonların ortalanması için */
.main-content {
  width: 100%; /* Tam genişlik */
  margin: 0 auto; /* Ortala */
  padding: 0 30px; /* Yanlarda boşluk */
}



/* Mobile Responsive Navbar */

@media (max-width: 992px) {
  .navbar-header {
    float: none;
  }
  .navbar-toggle {
    display: block;
  }
  .navbar-collapse {
    border-top: 1px solid transparent;
    box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
    transition: height 0.3s ease-in-out;
    overflow: hidden;
  }
  .navbar-collapse.collapse {
    display: none !important;
  }
  
    .navbar-collapse.collapse.in {
    display: block !important;
    height: auto !important;
    max-height: 80vh; /* Ekranın %80'ini kapla */
    overflow-y: auto; /* Gerekirse dikey kaydırma ekle */
  }
  
  
  .navbar-nav {
    float: none !important;
    margin: 7.5px -15px;
  }
  .navbar-nav > li {
    float: none;
  }
  .navbar-nav > li > a {
    padding-top: 10px;
    padding-bottom: 10px;
  }
  
  /* Central Title Fixes */
  #central-title {
    font-size: 36px !important;
    width: 90% !important;
    top: 30% !important;
  }
  
  #central-subtitle {
    font-size: 20px !important;
    top: 42% !important;
    width: 90% !important;
  }
  
  /* Layout Improvements */
  .slide-content {
    width: 95% !important;
    padding: 15px !important;
  }
  
  .product-category {
    width: 100% !important;
  }
  
  .about-section {
    flex-direction: column !important;
  }
  
  .contact-container {
    flex-direction: column !important;
  }
}

/* Extra small devices */
@media (max-width: 576px) {
  #central-title {
    font-size: 28px !important;
    top: 25% !important;
  }
  
  #central-subtitle {
    font-size: 16px !important;
    top: 35% !important;
  }
  
  .page-title {
    font-size: 28px !important;
  }
}

/* Slider dots daha belirgin */
.slider-dots {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  margin-bottom: 10px;
  gap: 10px;
}

.slider-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.3);
  cursor: pointer;
  transition: all 0.3s ease;
}

.slider-dot.active {
  width: 30px;
  border-radius: 6px;
  background-color: #00ccff;
}

/* Kaydırma ipucunu daha belirgin yapın */
.swipe-hint {
  text-align: center;
  padding: 12px;
  margin-top: 10px;
  color: rgba(255, 255, 255, 0.8);
  background-color: rgba(0, 8, 20, 0.4);
  border-radius: 30px;
  animation: pulse 2s infinite;
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 500px;
  margin-left: auto;
  margin-right: auto;
}

.swipe-hint i {
  font-size: 18px;
  color: #00ccff;
}

@keyframes pulse {
  0% {
    opacity: 0.6;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0.6;
  }
}

/* Tamamen yeniden tasarlanmış basit slider */
.simple-slider-container {
  position: relative;
  width: 100%;
  max-width: 1600px; /* Daha geniş maksimum genişlik */
  margin: 0 auto;
  padding: 40px 0;
}

.simple-slides-wrapper {
  position: relative;
  width: 100%;
  height: 500px;
  overflow: hidden;
}

.simple-slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.5s, visibility 0.5s;
}

.simple-slide.active {
  opacity: 1;
  visibility: visible;
}

.slider-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10;
  background: rgba(0, 204, 255, 0.3);
  color: white;
  border: none;
  width: 50px;
  height: 50px;
  border-radius: 25px;
  font-size: 24px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
}

.slider-btn:hover {
  background: rgba(0, 204, 255, 0.6);
  transform: translateY(-50%) scale(1.1);
}

.slider-btn.prev {
  left: 20px;
}

.slider-btn.next {
  right: 20px;
}

/* Noktaları büyüt ve belirginleştir */
.slider-dots {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  gap: 12px;
}

.slider-dot {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.3);
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}

.slider-dot.active {
  width: 45px;
  border-radius: 8px;
  background-color: #00ccff;
  box-shadow: 0 0 10px rgba(0, 204, 255, 0.7);
}

/* Kaydırma ipucu */
.swipe-hint {
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: 12px 24px;
  margin: 15px auto;
  max-width: 90%;
  width: 400px;
  background-color: rgba(0, 8, 20, 0.5);
  border-radius: 30px;
  color: rgba(255, 255, 255, 0.9);
  font-weight: 500;
  animation: pulse 2s infinite;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

/* Yatay kaydırmalı kategoriler için stil */
.horizontal-categories {
  -webkit-overflow-scrolling: touch;
  scrollbar-width: thin;
  scrollbar-color: rgba(0, 204, 255, 0.5) rgba(0, 8, 20, 0.3);
}

.horizontal-categories::-webkit-scrollbar {
  height: 8px;
}

.horizontal-categories::-webkit-scrollbar-track {
  background: rgba(0, 8, 20, 0.3);
  border-radius: 4px;
}

.horizontal-categories::-webkit-scrollbar-thumb {
  background-color: rgba(0, 204, 255, 0.5);
  border-radius: 4px;
}

.category-card {
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.category-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
}

.product-tag {
  transition: all 0.2s ease;
  cursor: pointer;
}

.product-tag:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Ürün kategorileri yatay kaydırma */
.products-container {
  scrollbar-width: thin;
  scrollbar-color: rgba(0, 204, 255, 0.5) rgba(0, 8, 20, 0.3);
  -webkit-overflow-scrolling: touch;
  padding-bottom: 10px;
  max-width: 95%; /* Genişliği artırdık */
  margin: 0 auto; /* Ortala */
}

.products-container::-webkit-scrollbar {
  height: 8px;
}

.products-container::-webkit-scrollbar-track {
  background: rgba(0, 8, 20, 0.3);
  border-radius: 4px;
}

.products-container::-webkit-scrollbar-thumb {
  background-color: rgba(0, 204, 255, 0.5);
  border-radius: 4px;
}

/* Ürün kategori kartları */
.product-category-card {
  flex: 0 0 350px; /* Genişliği artırdık */
  min-width: 350px; /* Minimum genişliği artırdık */
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
  border-top: 3px solid #00ccff;
  padding: 30px !important; /* İç boşluğu artırdık */
}

.product-category-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
  border-top: 3px solid #ff2975;
}

/* Ürün etiketleri */
.product-items {
  scrollbar-width: thin;
  scrollbar-color: rgba(0, 204, 255, 0.3) rgba(0, 8, 20, 0.2);
  height: 250px !important; /* Yüksekliği artırdık */
}

.product-items::-webkit-scrollbar {
  width: 6px; /* Genişliği artırdık */
}

.product-items::-webkit-scrollbar-track {
  background: rgba(0, 8, 20, 0.2);
  border-radius: 3px;
}

.product-items::-webkit-scrollbar-thumb {
  background-color: rgba(0, 204, 255, 0.3);
  border-radius: 3px;
}

.product-item-tag {
  padding: 10px 18px !important; /* İç boşluğu artırdık */
  font-size: 16px !important; /* Font boyutunu artırdık */
  cursor: pointer;
}

.product-item-tag:hover {
  transform: translateY(-3px);
  background: rgba(255, 41, 117, 0.15);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Çözümler sayfası için stiller */
.col-md-4, .col-md-6, .col-lg-4 {
  padding: 0 20px; /* Yanlarda daha fazla boşluk */
}

/* Ana içerik konteynerini genişlet */
.container {
  max-width: 1600px !important; /* Bootstrap container'ı genişlet */
  width: 90% !important;
  margin: 0 auto !important;
}

/* Sayfa boşluklarını düzenle */
.row {
  margin-left: -20px !important;
  margin-right: -20px !important;
}
    ")),
    
    # In the tags$head section of your UI
    tags$script(HTML("
  $(document).ready(function(){
    // Handle hamburger menu toggle
    $(\".navbar-toggle\").on(\"click\", function(){
      $(\"#navbar-collapse\").toggleClass(\"in\");
    });
    
    // Close mobile menu when item is clicked
    $(\".navbar-nav li a\").click(function(){
      $(\".navbar-collapse\").removeClass(\"in\");
    });
  });
")),
    
    tags$script(HTML("
  $(document).ready(function(){
    // Hamburger menü toggle
    $(\".navbar-toggle\").on(\"click\", function(e){
      e.preventDefault();
      e.stopPropagation();
      $(\"#navbar-collapse\").toggleClass(\"in\");
    });
    
    // Menü öğelerine tıklandığında menüyü kapatma
    // Bu event'i değiştiriyoruz - sadece sayfaya gezindikten SONRA menüyü kapat
    $(\".navbar-nav li a\").click(function(e){
      // Hemen kapanmasını önlemek için event propagation'ı durdur
      e.stopPropagation();
      
      // Event'in normal davranışına izin ver (sayfa değiştirme)
      // Sayfa değiştikten sonra menüyü kapat
      setTimeout(function() {
        $(\"#navbar-collapse\").removeClass(\"in\");
      }, 300); // 300ms gecikme ekle
    });
    
    // Menü dışında bir yere tıklandığında menüyü kapat
    $(document).click(function(e) {
      // Eğer tıklanan eleman menü veya toggle butonu değilse
      if (!$(e.target).closest('.navbar-collapse, .navbar-toggle').length) {
        if ($('#navbar-collapse').hasClass('in')) {
          $('#navbar-collapse').removeClass('in');
        }
      }
    });
  });
")),
    
    
    
    # jQuery yükle
    tags$script(src = "https://code.jquery.com/jquery-3.6.0.min.js"),
    
    tags$script(HTML("
  // Sayfa yüklenmesi beklenmeden elemanların görünürlüğünü zorla
  document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded, forcing visibility');
    makeElementsVisible();
  });

  // Sayfa kaynakları yüklenmeden elemanların görünürlüğünü zorla (daha erken)
  window.addEventListener('load', function() {
    console.log('Window fully loaded, forcing visibility again');
    makeElementsVisible();
  });

  // Elemanları görünür yapma fonksiyonu
  function makeElementsVisible() {
    console.log('Making elements visible');
    
    // Doğrudan DOM manipülasyonu ile görünürlüğü zorluyoruz
    var centralTitle = document.getElementById('central-title');
    var centralSubtitle = document.getElementById('central-subtitle');
    
    if (centralTitle) {
      centralTitle.style.cssText = 'opacity: 1 !important; visibility: visible !important; display: block !important;';
    }
    
    if (centralSubtitle) {
      centralSubtitle.style.cssText = 'opacity: 1 !important; visibility: visible !important; display: block !important;';
    }
    
    // Yükleme ekranını kaldır
    var waiter = document.querySelector('.waiter-overlay');
    if (waiter) {
      waiter.style.display = 'none';
    }
  }

  // Hemen çalıştır (sayfa henüz tam yüklenmeden)
  (function immediateRun() {
    console.log('Immediate visibility run');
    
    // Biraz gecikme ile çalıştırma (10ms)
    setTimeout(function() {
      makeElementsVisible();
      
      // Ek olarak tekrar deneme için 100ms sonra tekrar çalıştır
      setTimeout(makeElementsVisible, 100);
      
      // Ve 500ms sonra son bir kez daha
      setTimeout(makeElementsVisible, 500);
    }, 10);
  })();
")),
    
    # Slider için JavaScript
    tags$script(HTML("
// Tamamen basit ve yeni slider için JavaScript
let currentSlide = 0;
const totalSlides = 3; // Toplam slide sayısı

// Slide göster fonksiyonu
function showSlide(index) {
  // Mevcut sınırlar içinde tutma
  if (index < 0) index = 0;
  if (index >= totalSlides) index = totalSlides - 1;
  
  // Mevcut slide'yi deaktif et
  document.querySelectorAll('.simple-slide').forEach(slide => {
    slide.classList.remove('active');
  });
  
  // İstenen slide'yi aktif et
  document.getElementById('slide-' + index).classList.add('active');
  
  // Dot'ları güncelle
  document.querySelectorAll('.slider-dot').forEach((dot, i) => {
    if (i === index) {
      dot.classList.add('active');
    } else {
      dot.classList.remove('active');
    }
  });
  
  // Global slide indeksini güncelle
  currentSlide = index;
}

// İleri-geri fonksiyonu
function changeSlide(direction) {
  showSlide(currentSlide + direction);
}

// Sayfa yüklendiğinde çalıştır
document.addEventListener('DOMContentLoaded', function() {
  // Noktalara tıklama olayları
  document.querySelectorAll('.slider-dot').forEach((dot, index) => {
    dot.addEventListener('click', function() {
      showSlide(index);
    });
  });
  
  // İlk slide'yi göster
  showSlide(0);
});
    ")),
    
    
    # // UI başlangıcında yüklendikten hemen sonra başlık ve alt başlığı görünür hale getir
    tags$script(HTML("
  // Hemen yürütülecek IIFE (Immediately Invoked Function Expression)
  (function() {
    // Sayfanın tamamen yüklenmesini beklemeden hemen uygula
    document.getElementById('central-title').style.opacity = '1';
    document.getElementById('central-title').style.visibility = 'visible';
    document.getElementById('central-subtitle').style.opacity = '1';
    document.getElementById('central-subtitle').style.visibility = 'visible';
    
    // Sağdaki divler için
    var scrollingDiv = document.getElementById('scrolling-divs-container');
    if (scrollingDiv) {
      scrollingDiv.style.opacity = '1';
      scrollingDiv.style.visibility = 'visible';
    }
    
    // Yükleme ekranını hızlıca kaldır
    var waiterOverlay = document.querySelector('.waiter-overlay');
    if (waiterOverlay) {
      waiterOverlay.style.display = 'none';
    }
  })();
  
  // Sayfa tam yüklendiğinde tekrar kontrol et
  document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('central-title').style.opacity = '1';
    document.getElementById('central-title').style.visibility = 'visible';
    document.getElementById('central-subtitle').style.opacity = '1';
    document.getElementById('central-subtitle').style.visibility = 'visible';
    
    var scrollingDiv = document.getElementById('scrolling-divs-container');
    if (scrollingDiv) {
      scrollingDiv.style.opacity = '1';
      scrollingDiv.style.visibility = 'visible';
    }
    
    // Waiter overlay'ı gizle (jQuery ile)
    $('.waiter-overlay').fadeOut(50);
  });
")),
    
    
    # Canvas animasyonu için JavaScript
    tags$script(HTML("
      document.addEventListener('DOMContentLoaded', function() {
  setTimeout(function() {  // Animasyonu biraz geciktirerek başlatmak
    // Canvas animasyonu
    const container = document.getElementById('canvas-container');
    if (!container) return;  // Container varsa devam et
    
    const canvas = document.createElement('canvas');
    container.appendChild(canvas);
    const ctx = canvas.getContext('2d');

    let width = window.innerWidth;
    let height = window.innerHeight;
    canvas.width = width;
    canvas.height = height;

    let mouse = { x: width / 2, y: height / 2, radius: 180 };  // Default değerlerle başlat
    let lastMouseX = width / 2;
    let lastMouseY = height / 2;
    let mouseVelocityX = 0;
    let mouseVelocityY = 0;

    window.addEventListener('mousemove', function(event) {
      mouseVelocityX = event.clientX - lastMouseX;
      mouseVelocityY = event.clientY - lastMouseY;
      lastMouseX = mouse.x = event.clientX;
      lastMouseY = mouse.y = event.clientY;
    });

    window.addEventListener('resize', function() {
      width = window.innerWidth;
      height = window.innerHeight;
      canvas.width = width;
      canvas.height = height;
      init();
    });

    // Semboller için array
    const symbols = [
      '∑', '∫', 'π', '√', '∞', 'µ', 'σ', 'λ', '∂', '∝', 'Ω', 'Φ', '¹', '²', '³', '%', '€', '£', '#', 'A', 'x', 'y', 'z', '+', '-', '*', '/', '=', '<', '>', '!', '?'
    ];
    const colors = [ '#00ccff', '#00eeff', '#64f0ff', '#0cf', '#0ff', '#0077cc', '#99ccff','#ff69b4', '#ff1493', '#da70d6', '#ba55d3', '#9400d3', '#8a2be2', '#00ffff', '#7fffd4', '#66cdaa', '#20b2aa', '#008080', '#006400','#ffa500', '#ff8c00', '#ff4500','#ffff00'];

    let symbolsArray = [];

    class Symbol {
      constructor(x, y, size) {
        this.x = x;
        this.y = y;
        this.z = Math.random() * 400 - 200;
        this.size = size;
        this.baseSize = (Math.random() * 30) + 10;
        this.velocity = { x: (Math.random() - 0.5) * 1.5, y: (Math.random() - 0.5) * 1.5, z: (Math.random() - 0.5) * 1 };
        this.opacity = 0.2 + Math.random() * 0.2;
        this.baseSize = size * 2;
        this.symbol = symbols[Math.floor(Math.random() * symbols.length)];
        this.color = colors[Math.floor(Math.random() * colors.length)];
      }

      update() {
        const predictedMouseX = mouse.x + mouseVelocityX * 0.5;
        const predictedMouseY = mouse.y + mouseVelocityY * 0.5;

        let dx = this.x - predictedMouseX;
        let dy = this.y - predictedMouseY;
        let distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < mouse.radius) {
          const force = Math.pow((mouse.radius - distance) / mouse.radius, 1.5) * 1.2;
          const directionX = dx / distance || 0;
          const directionY = dy / distance || 0;
          this.x += directionX * force * 12;
          this.y += directionY * force * 12;
          this.velocity.x += directionX * force * 3;
          this.velocity.y += directionY * force * 3;
          this.opacity = Math.min(0.7, 0.4 + force * 0.3);
        } else {
          this.opacity = Math.max(0.2, this.opacity - 0.01);
        }

        this.x += this.velocity.x;
        this.y += this.velocity.y;
        this.z += this.velocity.z;

        if (this.x - this.size > width) this.x = 0 - this.size;
        if (this.x + this.size < 0) this.x = width + this.size;
        if (this.y - this.size > height) this.y = 0 - this.size;
        if (this.y + this.size < 0) this.y = height + this.size;

        if (this.z > 300) { this.z = 300; this.velocity.z *= -0.8; }
        if (this.z < -300) { this.z = -300; this.velocity.z *= -0.8; }

        this.velocity.x *= 0.97;
        this.velocity.y *= 0.97;
        this.velocity.z *= 0.97;

        const perspective = 800;
        const scale = perspective / (perspective + this.z);
        this.size = this.baseSize * scale;

        this.draw(scale);
      }

      draw(scale) {
        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.scale(scale, scale);
        ctx.globalAlpha = this.opacity;
        ctx.fillStyle = this.color;
        ctx.font = (this.baseSize * 0.8) + 'px Inter';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText(this.symbol, 0, 0);
        ctx.restore();
      }

      calculateDistance(symbol) {
        const dx = this.x - symbol.x;
        const dy = this.y - symbol.y;
        const dz = this.z - symbol.z;
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
      }
    }

    function init() {
      symbolsArray = [];
      const numberOfSymbols = width < 768 ? 80 : 150;
      for (let i = 0; i < numberOfSymbols; i++) {
        const size = Math.random() * 20 + 10;
        const x = Math.random() * (width - size * 2) + size;
        const y = Math.random() * (height - size * 2) + size;
        symbolsArray.push(new Symbol(x, y, size));
      }
    }

    function drawConnections() {
      const connectionDistance = 220;
      const maxConnections = 500;
      let drawnConnections = 0;

      // Z derinliğine göre sırala
      symbolsArray.sort((a, b) => b.z - a.z);

      for (let i = 0; i < symbolsArray.length && drawnConnections < maxConnections; i++) {
        for (let j = i + 1; j < symbolsArray.length && drawnConnections < maxConnections; j++) {
          const distance = symbolsArray[i].calculateDistance(symbolsArray[j]);
          if (distance < connectionDistance) {
            const opacity = Math.max(0.2, 0.5 * (1 - distance / connectionDistance));
           ctx.strokeStyle = 'rgba(0, 119, 204, ' + opacity + ')';
            ctx.lineWidth = 1;
            ctx.beginPath();
            ctx.moveTo(symbolsArray[i].x, symbolsArray[i].y);
            ctx.lineTo(symbolsArray[j].x, symbolsArray[j].y);
            ctx.stroke();
            drawnConnections++;
          }
        }
      }
    }

    function animate() {
      requestAnimationFrame(animate);

      ctx.clearRect(0, 0, width, height);
ctx.fillStyle = '#ffffff';
ctx.fillRect(0, 0, width, height);

      symbolsArray.forEach(symbol => {
        symbol.update();
      });

      drawConnections();
    }

    init();
    animate();
  }, 500);  // 500ms gecikme
});
    "))
  ),
  
  
  
  
  # Canvas container
  div(id = "canvas-container"),
  
  
  # Ana sayfa başlık ve alt başlık
  conditionalPanel(
    condition = "input.navTab == 'home' || !input.navTab",  # !input.navTab ekleyin ki ilk açılışta da görünsün
    div(
      style = "min-height: 100vh; position: relative;", 
      div(id = "central-title", 
          style = "opacity: 1 !important; visibility: visible !important; display: block !important;",
          HTML("<span class='special-letter-g'>G</span><span class='special-letter-e'>E</span><span class='regular-letter'>wend Analytics</span>")
      ),
      div(id = "central-subtitle", 
          style = "opacity: 1 !important; visibility: visible !important; display: block !important;",
          textOutput("mainSubtitle"))
    ),
    
    # Aşağı kaydırma butonu
    div(
      id = "scrollDownBtn",
      style = "position: absolute; bottom: 30px; left: 50%; transform: translateX(-50%);
          z-index: 10; cursor: pointer; text-align: center; animation: bounce 2s infinite;",
      tags$i(class = "fas fa-chevron-down", style = "font-size: 24px; color: #00ccff;"),
      p("Keşfet", style = "margin-top: 10px; color: #00ccff; font-size: 14px; font-weight: 500;")
    )
  ),
  
  # Tüm sayfa UI'ını dinamik olarak oluştur
  uiOutput("dynamicUI")
)


# SERVER ----

server <- function(input, output, session) {
  
  # Sayfa yüklendikten hemen sonra yükleme ekranını anında kaldır
  waiter_hide()
  
  
  
  # Ana sayfa görünürlüğünü başlangıçta ayarlayalım
  observe({
    # Sayfa ilk açıldığında ana sayfayı aktif yap
    if (is.null(input$navTab)) {
      updateTabsetPanel(session, "navTab", selected = "home")
    }
  })
  
  # Elemenlerin görünürlüğünü zorla - Modifiye edilmiş kod
  shinyjs::runjs("
    // Ana görünürlük fonksiyonu
    function forceVisibility() {
      console.log('Server side: Forcing visibility');
      
      // Yükleme ekranını doğrudan kaldır
      var waiterOverlays = document.querySelectorAll('.waiter-overlay');
      if (waiterOverlays && waiterOverlays.length > 0) {
        waiterOverlays.forEach(function(overlay) {
          overlay.style.display = 'none';
        });
      }
      
      // Ana elemanları görünür yap - daha güçlü zorla
      if (document.getElementById('central-title')) {
        document.getElementById('central-title').style.cssText = 'opacity: 1 !important; visibility: visible !important; display: block !important;';
      }
      
      if (document.getElementById('central-subtitle')) {
        document.getElementById('central-subtitle').style.cssText = 'opacity: 1 !important; visibility: visible !important; display: block !important;';
      }
    }
    
    // Hemen çalıştır 
    forceVisibility();
    
    // 50ms sonra tekrar dene
    setTimeout(forceVisibility, 50);
    
    // 200ms sonra bir kez daha
    setTimeout(forceVisibility, 200);
  ")
  
  # Reactive Value'ları başlangıç değerleriyle ayarla
  current_lang <- reactiveVal("tr")
  active_tab <- reactiveVal("home")  # başlangıçta home aktif olsun
  
  # Appimize Video Div Fonksiyonu
  appimizeVideoDiv <- function(videoSrc, title, subtitle) {
    div(class = "appimize-container",
        div(class = "appimize-frame",
            # Video elemanı
            tags$video(
              class = "appimize-video",
              src = videoSrc,
              autoplay = NA,
              loop = NA,
              muted = NA,
              playsinline = NA
            ),
            
            # Başlık ve alt başlık
            div(class = "appimize-header",
                h1(class = "appimize-title", title),
                h2(class = "appimize-subtitle", subtitle)
            ),
            
            # Kontrol noktaları
            div(class = "appimize-controls",
                div(class = "control-dot active"),
                div(class = "control-dot"),
                div(class = "control-dot"),
                div(class = "control-dot"),
                div(class = "control-dot")
            ),
            
            # Yenileme butonu
            div(class = "refresh-button",
                tags$i(class = "fas fa-sync-alt")
            )
        )
    )
  }
  
  # Geçerli dil
  current_lang <- reactiveVal("tr")
  
  # Aktif tab
  active_tab <- reactiveVal("home")
  
  # Dil değiştirme
  observeEvent(input$switchLanguage, {
    # İşlem öncelikli olarak dil değişimini uygulaması için priority: 'event' ekliyoruz
    current_lang(ifelse(current_lang() == "tr", "en", "tr"))
  })
  
  # Tab değiştirme
  observeEvent(input$navTab, {
    active_tab(input$navTab)
  })
  
  # Ana sayfa alt başlık - Acil oluşturulması için öncelikli olarak çalıştır
  output$mainSubtitle <- renderText({
    lang <- current_lang()
    translations[[lang]]$main_subtitle
  })
  
  # Ürün kartları
  output$productCards <- renderUI({
    lang <- current_lang()
    t <- translations[[lang]]
    
    lapply(seq_along(product_data), function(idx) {
      cname <- names(product_data)[idx]
      cardid <- paste0("card_", gsub("[^A-Za-z0-9]", "", tolower(cname)))
      cat_name <- t[[cname]]
      
      # Popupları derle
      popups <- lapply(product_data[[cname]], function(p) {
        div(class = "product-popup-vertical", 
            tagList(
              tags$i(class = paste0("fas fa-", p$icon)),
              span(p$name)
            )
        )
      })
      
      # Kart render
      div(class = "info-card", id = cardid,
          h3(cat_name),
          p("Aktüeryal çözümler için profesyonel araçlar"),
          img(src = paste0("https://placeholder.pics/svg/300x150/",
                           sample(c("00ccff","ff2975","7b3fe4","ff8d3f"),1),
                           "-000814/FFFFFF/",
                           toupper(gsub("\\s", "%20", substr(cat_name,1,16)))
          ),
          alt = cat_name),
          div(class = "products-popup-vertical", popups)
      )
    })
  })
  
  ## DYNAMIC UI ----
  output$dynamicUI <- renderUI({
    # Dil ve aktif tab bilgisini al
    lang <- current_lang()
    tab <- active_tab()
    t <- translations[[lang]]
    
    # Tüm sayfayı oluştur
    tagList(
      
      # NavBar
      div(class = "navbar navbar-default navbar-static-top",
          div(class = "container-fluid",
              # Logo and toggle button for mobile
              div(class = "navbar-header",
                  # Hamburger toggle button - ADD THIS
                  tags$button(
                    type = "button",
                    class = "navbar-toggle collapsed",
                    `data-toggle` = "collapse",
                    `data-target` = "#navbar-collapse",
                    `aria-expanded` = "false",
                    tags$span(class = "sr-only", "Toggle navigation"),
                    tags$span(class = "icon-bar"),
                    tags$span(class = "icon-bar"),
                    tags$span(class = "icon-bar")
                  ),
                  # Brand/logo
                  span(class = "navbar-brand", "GEwend Analytics")
              ),
              
              # Collapsible navbar content - MODIFY THIS
              div(id = "navbar-collapse", class = "collapse navbar-collapse",
                  # The main menu items (formerly in a separate container)
                  tags$ul(class = "nav navbar-nav",
                          tags$li(class = ifelse(tab == "home", "active", ""),
                                  a(href = "#", onclick = "Shiny.setInputValue('navTab', 'home')", 
                                    t$home)
                          ),
                          tags$li(class = ifelse(tab == "products", "active", ""),
                                  a(href = "#", onclick = "Shiny.setInputValue('navTab', 'products')", 
                                    t$products)
                          ),
                          tags$li(class = ifelse(tab == "solutions", "active", ""),
                                  a(href = "#", onclick = "Shiny.setInputValue('navTab', 'solutions')", 
                                    t$solutions)
                          ),
                          tags$li(class = ifelse(tab == "about", "active", ""),
                                  a(href = "#", onclick = "Shiny.setInputValue('navTab', 'about')", 
                                    t$about)
                          ),
                          tags$li(class = ifelse(tab == "contact", "active", ""),
                                  a(href = "#", onclick = "Shiny.setInputValue('navTab', 'contact')", 
                                    t$contact)
                          )
                  ),
                  
                  # Right-aligned elements (language switcher)
                  div(class = "navbar-right",
                      actionButton("switchLanguage", ifelse(lang == "tr", "EN", "TR"),
                                   class = "lang-btn")
                  )
              )
          )
      ),
      
      ## Ana Sayfa ----
      if (tab == "home") {
        div(
          
          # div(style = "height: 100vh; width: 100%;"),  # Boş bir div ile sayfa yüksekliği ekleyin
          
          
          # Öne Çıkan Özellikler
          div(
            style = "padding: 40px 20px; background: linear-gradient(180deg, rgba(0,8,20,0) 0%, rgba(0,8,20,0.8) 100%);",
            div(class = "container",
                h2(style = "text-align: center; font-size: 36px; margin-bottom: 40px; color: #00ccff;", 
                   "Öne Çıkan Özellikler"),
                
                div(class = "row text-center",
                    # Özellik 1
                    div(class = "col-md-4",
                        div(class = "feature-box", style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 30px; margin-bottom: 20px;
                              transition: all 0.3s ease; border-top: 3px solid #00ccff;",
                            tags$i(class = "fas fa-chart-line", style = "font-size: 48px; color: #00ccff; margin-bottom: 20px;"),
                            h3("Yapay Zeka Destekli Analiz", style = "color: white; margin-bottom: 15px;"),
                            p("Gelişmiş yapay zeka algoritmaları ile veri analizinde devrim.", 
                              style = "color: #ccc; font-size: 16px;")
                        )
                    ),
                    
                    # Özellik 2
                    div(class = "col-md-4",
                        div(class = "feature-box", style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 30px; margin-bottom: 20px;
                              transition: all 0.3s ease; border-top: 3px solid #ff2975;",
                            tags$i(class = "fas fa-shield-alt", style = "font-size: 48px; color: #ff2975; margin-bottom: 20px;"),
                            h3("Gelişmiş Risk Modelleme", style = "color: white; margin-bottom: 15px;"),
                            p("Sigorta risklerini benzersiz algoritmalarla tahminleyin ve yönetin.", 
                              style = "color: #ccc; font-size: 16px;")
                        )
                    ),
                    
                    # Özellik 3
                    div(class = "col-md-4",
                        div(class = "feature-box", style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 30px; margin-bottom: 20px;
                              transition: all 0.3s ease; border-top: 3px solid #7b3fe4;",
                            tags$i(class = "fas fa-tachometer-alt", style = "font-size: 48px; color: #7b3fe4; margin-bottom: 20px;"),
                            h3("Gerçek Zamanlı Dashboard", style = "color: white; margin-bottom: 15px;"),
                            p("Anlık verilerle sürekli güncellenen interaktif gösterge panelleri.", 
                              style = "color: #ccc; font-size: 16px;")
                        )
                    )
                )
            )
          ),
          
          # Öne Çıkan Özellikler bölümünden sonra eklenecek
          # Ürün Kategorileri bölümü - yatay kaydırmalı
          div(class = "products-section",
              style = "padding: 40px 20px; margin-top: 60px; background: linear-gradient(180deg, rgba(0,8,20,0) 0%, rgba(0,8,20,0.5) 100%);",
              h2(style = "text-align: center; font-size: 36px; margin-bottom: 40px; color: #00ccff;", 
                 "Ürün Kategorileri"),
              
              # Yatay kaydırılabilir kartlar
              div(class = "products-container",
                  style = "display: flex; overflow-x: auto; padding: 20px 0; gap: 25px; margin: 0 auto; max-width: 90%; position: relative;",
                  
                  # Kategori kartları
                  lapply(seq_along(product_data), function(idx) {
                    cname <- names(product_data)[idx]
                    cat_name <- t[[cname]]
                    
                    div(class = "product-category-card", 
                        style = "flex: 0 0 300px; min-width: 300px; background-color: rgba(0,8,20,0.7); 
                  border-radius: 12px; padding: 25px; transition: all 0.3s ease;",
                        
                        # Kategori başlığı
                        h3(cat_name, 
                           style = "color: #00ccff; text-align: center; margin-bottom: 15px; font-size: 22px;"),
                        
                        # Kategori açıklaması
                        p("Aktüeryal çözümler için profesyonel araçlar", 
                          style = "color: #aaa; text-align: center; font-size: 14px; margin-bottom: 20px;"),
                        
                        # Ürün listesi (etiketler)
                        div(class = "product-items",
                            style = "height: 200px; overflow-y: auto; display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;",
                            
                            # Bu kategorideki ürünler
                            lapply(product_data[[cname]], function(p) {
                              div(class = "product-item-tag",
                                  style = "background: rgba(0,204,255,0.1); border-radius: 30px; 
                            padding: 8px 15px; display: flex; align-items: center;
                            border-left: 2px solid #00ccff; border-right: 2px solid #ff2975;
                            transition: all 0.2s ease;",
                                  tags$i(class = paste0("fas fa-", p$icon), 
                                         style = "margin-right: 8px; color: #00ccff;"),
                                  span(p$name, style = "color: #fff; font-size: 14px;")
                              )
                            })
                        )
                    )
                  })
              )
          ),
          
          
          # Slider Bölümü - Tamamen yeni ve basit yaklaşım
          div(class = "simple-slider-container",
              # Kaydırma butonları - bu sefer onları gösterelim
              tags$button(id="prev-slide", class = "slider-btn prev", 
                          HTML("&larr;"), 
                          onclick = "changeSlide(-1)"),
              tags$button(id="next-slide", class = "slider-btn next", 
                          HTML("&rarr;"), 
                          onclick = "changeSlide(1)"),
              
              # Slider içeriği
              div(class = "simple-slides-wrapper",
                  # Slide 1
                  div(class = "simple-slide active", id = "slide-0",
                      div(class = "slide-content",
                          div(class = "slide-text",
                              h2(t$slide1_title),
                              h3(t$slide1_subtitle),
                              p(t$slide1_text)
                          ),
                          div(class = "slide-image",
                              tags$video(
                                id = "slide1Video",
                                width = "100%",
                                height = "auto",
                                src = "videos/network_analysis.mp4",
                                style = "border-radius: 12px;",
                                autoplay = NA,
                                loop = NA,
                                muted = NA
                              )
                          )
                      )
                  ),
                  
                  # Slide 2
                  div(class = "simple-slide", id = "slide-1",
                      div(class = "slide-content",
                          div(class = "slide-text",
                              h2(t$slide2_title),
                              h3(t$slide2_subtitle),
                              p(t$slide2_text)
                          ),
                          div(class = "slide-image",
                              img(src = "https://placeholder.pics/svg/600x400/00ccff-000814/FFFFFF/AI%20Analytics", 
                                  alt = "AI Analytics")
                          )
                      )
                  ),
                  
                  # Slide 3
                  div(class = "simple-slide", id = "slide-2",
                      div(class = "slide-content",
                          div(class = "slide-text",
                              h2(t$slide3_title),
                              h3(t$slide3_subtitle),
                              p(t$slide3_text)
                          ),
                          div(class = "slide-image",
                              img(src = "https://placeholder.pics/svg/600x400/ff2975-000814/FFFFFF/Risk%20Management", 
                                  alt = "Risk Management")
                          )
                      )
                  )
              ),
              
              # Slider göstergeleri
              div(class = "slider-dots",
                  div(class = "slider-dot active", onclick = "showSlide(0)"),
                  div(class = "slider-dot", onclick = "showSlide(1)"),
                  div(class = "slider-dot", onclick = "showSlide(2)")
              )
          )
        )
      }
      ## Ürünler Sayfası ----
      else if (tab == "products") {
        div(class = "content-page",
            div(class = "page-container",
                h1(class = "page-title", t$products_title),
                
                # Kategori bazlı ürün gösterimi
                div(class = "products-grid",
                    lapply(seq_along(product_data), function(idx) {
                      cname <- names(product_data)[idx]
                      cat_name <- t[[cname]]
                      prods <- product_data[[cname]]
                      
                      div(class = "product-category",
                          h2(cat_name),
                          div(class="product-list",
                              lapply(prods, function(p) {
                                div(class = "product-item", 
                                    tags$i(class = paste0("fas fa-", p$icon)), 
                                    p$name)
                              })
                          )
                      )
                    })
                ),
                
                # Özel ürünler
                br(), br(),
                div(class = "row",
                    # Ürün 1
                    div(class = "col-md-6",
                        div(class = "product-card",
                            div(class = "product-image",
                                img(src = "https://placeholder.pics/svg/600x300/00ccff-000814/FFFFFF/Disability%20Calculator", 
                                    alt = "Disability Calculator")
                            ),
                            div(class = "product-details",
                                h3(class = "product-title", t$product1_title),
                                p(class = "product-desc", t$product1_desc),
                                p(class = "product-price", t$product1_price),
                                div(style = "display: flex; gap: 10px; margin-top: 15px;",
                                    a(class = "btn btn-primary", href = "https://example.com/product1", 
                                      style = "flex: 1; text-align: center;", t$learn_more),
                                    actionButton("buy_product1", t$buy_button, 
                                                 class = "btn btn-success", style = "flex: 1;")
                                )
                            )
                        )
                    ),
                    
                    # Ürün 2
                    div(class = "col-md-6",
                        div(class = "product-card",
                            div(class = "product-image",
                                img(src = "https://placeholder.pics/svg/600x300/ff2975-000814/FFFFFF/Life%20Tables%20Analysis", 
                                    alt = "Life Tables Analysis")
                            ),
                            div(class = "product-details",
                                h3(class = "product-title", t$product2_title),
                                p(class = "product-desc", t$product2_desc),
                                p(class = "product-price", t$product2_price),
                                div(style = "display: flex; gap: 10px; margin-top: 15px;",
                                    a(class = "btn btn-primary", href = "https://example.com/product2", 
                                      style = "flex: 1; text-align: center;", t$learn_more),
                                    actionButton("buy_product2", t$buy_button, 
                                                 class = "btn btn-success", style = "flex: 1;")
                                )
                            )
                        )
                    )
                )
            )
        )
      }
      ## Çözümler Sayfası ----
      else if (tab == "solutions") {
        div(class = "content-page",
            div(class = "page-container",
                h1(class = "page-title", "Çözümlerimiz"),
                
                # Case studies bölümü
                div(
                  style = "margin-bottom: 60px;",
                  h2(style = "text-align: center; font-size: 30px; margin-bottom: 30px; color: #00ccff;", 
                     "Başarı Öyküleri"),
                  
                  div(class = "row",
                      # Vaka Çalışması 1
                      div(class = "col-md-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; overflow: hidden; 
                                      transition: all 0.3s ease; height: 450px;",
                              div(style = "height: 200px; overflow: hidden;",
                                  img(src = "https://placeholder.pics/svg/400x200/00ccff-000814/FFFFFF/Case%20Study%201", 
                                      style = "width: 100%; height: 100%; object-fit: cover;")
                              ),
                              div(style = "padding: 20px;",
                                  h3("XYZ Sigorta Risk Analizi", style = "color: #00ccff; margin-bottom: 15px;"),
                                  p("XYZ Sigorta şirketi için geliştirdiğimiz risk analizi modeli ile şirket, hasar öngörülerinde %35 iyileşme sağladı.",
                                    style = "color: #ccc; font-size: 14px; height: 80px; overflow: hidden;"),
                                  div(style = "margin-top: 20px;",
                                      actionButton("caseStudy1", "Detayları Gör", 
                                                   style = "background: linear-gradient(to right, #00ccff, #7b3fe4);
                                                         color: white; border: none; border-radius: 30px; padding: 8px 15px;")
                                  )
                              )
                          )
                      ),
                      
                      # Vaka Çalışması 2
                      div(class = "col-md-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; overflow: hidden; 
                                      transition: all 0.3s ease; height: 450px;",
                              div(style = "height: 200px; overflow: hidden;",
                                  img(src = "https://placeholder.pics/svg/400x200/ff2975-000814/FFFFFF/Case%20Study%202", 
                                      style = "width: 100%; height: 100%; object-fit: cover;")
                              ),
                              div(style = "padding: 20px;",
                                  h3("ABC Emeklilik Fon Optimizasyonu", style = "color: #ff2975; margin-bottom: 15px;"),
                                  p("ABC Emeklilik için geliştirdiğimiz fon optimizasyon algoritması ile müşteri portföy getirilerinde %12 artış sağlandı.",
                                    style = "color: #ccc; font-size: 14px; height: 80px; overflow: hidden;"),
                                  div(style = "margin-top: 20px;",
                                      actionButton("caseStudy2", "Detayları Gör", 
                                                   style = "background: linear-gradient(to right, #ff2975, #ff8d3f);
                                                         color: white; border: none; border-radius: 30px; padding: 8px 15px;")
                                  )
                              )
                          )
                      ),
                      
                      # Vaka Çalışması 3
                      div(class = "col-md-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; overflow: hidden; 
                                      transition: all 0.3s ease; height: 450px;",
                              div(style = "height: 200px; overflow: hidden;",
                                  img(src = "https://placeholder.pics/svg/400x200/7b3fe4-000814/FFFFFF/Case%20Study%203", 
                                      style = "width: 100%; height: 100%; object-fit: cover;")
                              ),
                              div(style = "padding: 20px;",
                                  h3("DEF Sağlık Hastalık Tahmini", style = "color: #7b3fe4; margin-bottom: 15px;"),
                                  p("DEF Sağlık Sigortası için geliştirdiğimiz yapay zeka modeli, hastalık risklerini %28 daha doğru tahmin ediyor.",
                                    style = "color: #ccc; font-size: 14px; height: 80px; overflow: hidden;"),
                                  div(style = "margin-top: 20px;",
                                      actionButton("caseStudy3", "Detayları Gör", 
                                                   style = "background: linear-gradient(to right, #7b3fe4, #00c6ff);
                                                         color: white; border: none; border-radius: 30px; padding: 8px 15px;")
                                  )
                              )
                          )
                      )
                  )
                ),
                
                # Çözüm kategorileri
                div(
                  h2(style = "text-align: center; font-size: 30px; margin-bottom: 30px; color: #00ccff;", 
                     "Uzmanlık Alanlarımız"),
                  
                  div(class = "row",
                      # Alan 1
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #00ccff; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-chart-line", style = "font-size: 36px; color: #00ccff; margin-bottom: 15px;"),
                              h3("Aktüeryal Modelleme", style = "color: white; margin-bottom: 15px;"),
                              p("Hayat ve hayat dışı sigorta ürünleri için gelişmiş aktüeryal modeller ve hesaplamalar.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      ),
                      
                      # Alan 2
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #ff2975; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-brain", style = "font-size: 36px; color: #ff2975; margin-bottom: 15px;"),
                              h3("Yapay Zeka & Makine Öğrenmesi", style = "color: white; margin-bottom: 15px;"),
                              p("Veri odaklı tahminleme ve otomatik karar mekanizmaları için yapay zeka çözümleri.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      ),
                      
                      # Alan 3
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #7b3fe4; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-shield-alt", style = "font-size: 36px; color: #7b3fe4; margin-bottom: 15px;"),
                              h3("Risk Yönetimi", style = "color: white; margin-bottom: 15px;"),
                              p("Solvency II ve IFRS 17 uyumlu risk modellemeleri ve sermaye yeterlilik analizleri.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      ),
                      
                      # Alan 4
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #ff8d3f; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-chart-bar", style = "font-size: 36px; color: #ff8d3f; margin-bottom: 15px;"),
                              h3("İş Analitiği", style = "color: white; margin-bottom: 15px;"),
                              p("İş süreçlerinin optimizasyonu ve performans analizi için veri odaklı çözümler.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      ),
                      
                      # Alan 5
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #2ecc71; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-users", style = "font-size: 36px; color: #2ecc71; margin-bottom: 15px;"),
                              h3("Müşteri Analitiği", style = "color: white; margin-bottom: 15px;"),
                              p("Müşteri segmentasyonu, müşteri yaşam döngüsü değeri ve müşteri ihtiyaçları analizi.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      ),
                      
                      # Alan 6
                      div(class = "col-md-6 col-lg-4",
                          div(style = "background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; margin-bottom: 25px;
                                      border-left: 3px solid #9b59b6; transition: all 0.3s ease;",
                              tags$i(class = "fas fa-search-dollar", style = "font-size: 36px; color: #9b59b6; margin-bottom: 15px;"),
                              h3("Fiyatlama Stratejileri", style = "color: white; margin-bottom: 15px;"),
                              p("Optimum fiyatlama stratejileri ve rekabetçi pazar analizi için dinamik modeller.",
                                style = "color: #ccc; font-size: 14px;")
                          )
                      )
                  )
                )
            )
        )
      }
      ## Hakkımızda Sayfası ----
      else if (tab == "about") {
        div(class = "content-page",
            div(class = "page-container",
                h1(class = "page-title", t$about_title),
                
                div(class = "about-section",
                    div(class = "about-text",
                        h2(t$about_who),
                        p(t$about_who_text1),
                        p(t$about_who_text2)
                    ),
                    div(class = "about-image",
                        img(src = "https://placeholder.pics/svg/600x400/00ccff-000814/FFFFFF/Our%20Team", 
                            alt = "Our Team")
                    )
                ),
                
                div(class = "about-section",
                    div(class = "about-image",
                        img(src = "https://placeholder.pics/svg/600x400/ff2975-000814/FFFFFF/Our%20Mission", 
                            alt = "Our Mission")
                    ),
                    div(class = "about-text",
                        h2(t$about_mission),
                        p(t$about_mission_text),
                        h3(t$about_values),
                        p(t$about_values_text)
                    )
                ),
                
                div(class = "about-section",
                    div(class = "about-text",
                        h2(t$about_vision),
                        p(t$about_vision_text)
                    ),
                    div(class = "about-image",
                        img(src = "https://placeholder.pics/svg/600x400/7b3fe4-000814/FFFFFF/Our%20Vision", 
                            alt = "Our Vision")
                    )
                )
            )
        )
      }
      ## İletişim Sayfası ----
      else if (tab == "contact") {
        div(class = "content-page",
            div(class = "page-container",
                h1(class = "page-title", t$contact_title),
                div(class = "contact-container",
                    div(class = "contact-form",
                        h2(t$contact_form_title),
                        div(class = "form-group",
                            textInput("name", t$contact_name, placeholder = t$contact_name)
                        ),
                        div(class = "form-group",
                            textInput("email", t$contact_email, placeholder = t$contact_email)
                        ),
                        div(class = "form-group",
                            selectInput("subject", t$contact_subject, 
                                        choices = c(t$subject_general, t$subject_support, t$subject_sales, t$subject_other))
                        ),
                        div(class = "form-group",
                            textAreaInput("message", t$contact_message, placeholder = t$contact_message, rows = 6)
                        ),
                        actionButton("submit", t$contact_submit, class = "btn-submit")
                    ),
                    div(class = "contact-info",
                        div(class = "info-item",
                            h3(class = "info-title", t$address_title),
                            p(t$address1),
                            p(t$address2)
                        ),
                        div(class = "info-item",
                            h3(class = "info-title", t$email_title),
                            p(t$email1),
                            p(t$email2)
                        ),
                        div(class = "info-item",
                            h3(class = "info-title", t$phone_title),
                            p(t$phone1),
                            p(t$phone2)
                        ),
                        div(class = "info-item",
                            h3(class = "info-title", t$hours_title),
                            p(t$hours1),
                            p(t$hours2)
                        )
                    )
                )
            )
        )
      }
    )
  })
  
  # İletişim formu gönderme
  observeEvent(input$submit, {
    lang <- current_lang()
    t <- translations[[lang]]
    
    showModal(modalDialog(
      title = t$contact_form_title,
      p(t$contact_success),
      easyClose = TRUE,
      footer = modalButton(t$contact_close)
    ))
  })
  
  # Satın alma butonları
  observeEvent(input$buy_product1, {
    lang <- current_lang()
    t <- translations[[lang]]
    
    msg <- if(lang == "tr") "Bu ürünü satın almak için sepete eklediniz." else "This product has been added to your cart."
    
    showModal(modalDialog(
      title = t$product1_title,
      div(
        style = "text-align: center;",
        tags$i(class = "fas fa-check-circle", 
               style = "color: #2ecc71; font-size: 48px; margin-bottom: 20px;"),
        p(msg, style = "font-size: 16px;"),
        p(if(lang == "tr") "Satın alma işlemini tamamlamak için hesabınıza giriş yapın." 
          else "Please login to your account to complete your purchase.", 
          style = "color: #888; font-size: 14px; margin-top: 10px;")
      ),
      easyClose = TRUE,
      footer = modalButton(t$contact_close)
    ))
  })
  
  observeEvent(input$buy_product2, {
    lang <- current_lang()
    t <- translations[[lang]]
    
    msg <- if(lang == "tr") "Bu ürünü satın almak için sepete eklediniz." else "This product has been added to your cart."
    
    showModal(modalDialog(
      title = t$product2_title,
      div(
        style = "text-align: center;",
        tags$i(class = "fas fa-check-circle", 
               style = "color: #2ecc71; font-size: 48px; margin-bottom: 20px;"),
        p(msg, style = "font-size: 16px;"),
        p(if(lang == "tr") "Satın alma işlemini tamamlamak için hesabınıza giriş yapın." 
          else "Please login to your account to complete your purchase.", 
          style = "color: #888; font-size: 14px; margin-top: 10px;")
      ),
      easyClose = TRUE,
      footer = modalButton(t$contact_close)
    ))
  })
  
  # Çözümler sayfası vaka çalışmaları
  observeEvent(input$caseStudy1, {
    showModal(modalDialog(
      title = "XYZ Sigorta Risk Analizi",
      div(
        h4("Proje Özeti", style = "color: #00ccff; border-bottom: 1px solid #333; padding-bottom: 10px;"),
        p("XYZ Sigorta, Türkiye'nin önde gelen sigorta şirketlerinden biri olarak, hasar tahminlerini iyileştirmek için ProInsure'dan yardım istedi."),
        
        h4("Zorluklar", style = "color: #00ccff; border-bottom: 1px solid #333; padding-bottom: 10px;"),
        tags$ul(
          tags$li("Yüksek hacimli ve karmaşık müşteri verisi"),
          tags$li("Mevsimsel trendler ve pazar dalgalanmaları"),
          tags$li("Eskimiş risk modelleme teknikleri")
        ),
        
        h4("Çözümümüz", style = "color: #00ccff; border-bottom: 1px solid #333; padding-bottom: 10px;"),
        p("ProInsure ekibi olarak:")
      )))
  }
  )
  
  # Kategori kartları için renderUI
  output$categoryCards <- renderUI({
    lang <- current_lang()
    t <- translations[[lang]]
    
    lapply(seq_along(product_data), function(idx) {
      cname <- names(product_data)[idx]
      cat_name <- t[[cname]]
      products <- product_data[[cname]]
      
      iconColors <- c("#00ccff", "#ff2975", "#7b3fe4", "#ff8d3f", "#2ecc71", "#9b59b6")
      color <- iconColors[(idx %% length(iconColors)) + 1]
      
      div(class = "category-card",
          style = paste0("flex: 0 0 300px; background: rgba(0,8,20,0.7); border-radius: 12px; padding: 25px; 
                      min-width: 300px; transition: all 0.3s ease; border-top: 3px solid ", color, ";"),
          
          # Kategori başlığı
          h3(cat_name, style = paste0("color: ", color, "; text-align: center; margin-bottom: 20px; font-size: 22px;")),
          
          # Alt yazı
          p("Aktüeryal çözümler için profesyonel araçlar", 
            style = "color: #aaa; text-align: center; font-size: 14px; margin-bottom: 20px;"),
          
          # Ürün listesi kutucukları
          div(class = "product-tags",
              style = "display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;",
              
              lapply(products, function(p) {
                div(class = "product-tag",
                    style = paste0("background: rgba(", substr(gsub("#", "", color), 1, 2), ",", 
                                   substr(gsub("#", "", color), 3, 4), ",", 
                                   substr(gsub("#", "", color), 5, 6), ",0.15); 
                               border-radius: 30px; padding: 8px 15px; display: flex; align-items: center;"),
                    tags$i(class = paste0("fas fa-", p$icon), 
                           style = paste0("margin-right: 8px; color: ", color, ";")),
                    span(p$name, style = "color: #fff; font-size: 14px;")
                )
              })
          )
      )
    })
  })
}

shinyApp(ui = ui, server = server)
