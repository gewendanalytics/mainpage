library(shiny)
library(shinyjs)
library(rsconnect)
rsconnect::writeManifest()

ui <- fluidPage(
  useShinyjs(),
  tags$head(
    tags$link(href="https://fonts.googleapis.com/css2?family=Inter:wght@300;700&display=swap", rel="stylesheet"),
    tags$style(HTML("
      body {
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #000814;
        font-family: 'Inter', Arial, sans-serif;
      }
      #canvas-container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
      }
      .container-fluid {
        padding: 0;
      }
      #logo {
        height: 40px;
        margin-right: 10px;
      }
      .navbar {
        background-color: rgba(0, 8, 20, 0.8);
        border: none;
        padding: 15px 0;
        position: absolute;
        top: 0;
        width: 100%;
        z-index: 10;
      }
      .navbar-default {
        background-image: none;
        box-shadow: none;
      }
      .navbar-brand {
        padding: 10px 15px;
      }
      .navbar-nav > li > a {
        color: #0cf !important;
        font-weight: 500;
        padding: 15px 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
      }
      .navbar-nav > li > a:hover {
        color: #0ff !important;
        background-color: transparent !important;
      }
      .navbar-nav > .active > a, 
      .navbar-nav > .active > a:hover {
        background-color: rgba(0, 204, 255, 0.1) !important;
        color: #0cf !important;
      }
      .navbar-right .btn {
        margin-top: 8px;
        background-color: rgba(0, 204, 255, 0.2);
        color: #0cf;
        border: 1px solid #0cf;
        padding: 8px 20px;
        border-radius: 0;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
      }
      .navbar-right .btn:hover {
        background-color: rgba(0, 204, 255, 0.4);
        box-shadow: 0 0 15px rgba(0, 204, 255, 0.5);
      }
      .content {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
        padding: 0 20px;
        position: relative;
        z-index: 1;
      }
      
      #central-title {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #FFFFFF;
        font-size: 120px;
        font-weight: 700;
        font-family: 'Inter', Arial, sans-serif;
        text-shadow: 0 0 30px rgba(255, 255, 255, 0.8);
        z-index: 999;
        text-align: center;
        animation: float 6s ease-in-out infinite;
      }
      
      #central-subtitle {
        position: absolute;
        top: 62%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #FFFFFF;
        background: linear-gradient(90deg, #00c6ff, #7b3fe4, #ff2975, #ff8d3f); 
        -webkit-background-clip: text; 
        -webkit-text-fill-color: transparent; 
        background-clip: text;
        text-fill-color: transparent;
        display: inline-block;
        text-shadow: 0 0 15px rgba(0, 198, 255, 0.5), 0 0 25px rgba(123, 63, 228, 0.3), 0 0 35px rgba(255, 41, 117, 0.3), 0 0 45px rgba(255, 141, 63, 0.3);
        font-size: 62px;
        font-weight: 300;
        font-family: 'Inter', Arial, sans-serif;
        text-shadow: 0 0 20px rgba(255, 255, 255, 0.6);
        z-index: 999;
        text-align: center;
        letter-spacing: 3px;
        animation: float 6s ease-in-out infinite reverse;
        text-transform: capitalize;
      }
      
      @keyframes float {
        0% {
          transform: translate(-50%, -50%);
        }
        50% {
          transform: translate(-50%, -55%);
        }
        100% {
          transform: translate(-50%, -50%);
        }
      }
    "))
  ),
  
  
  div(id = "canvas-container"),
  div(id = "central-title", "GEwend Analytics"),
  # div( h1(
  #   style = "font-size: 82px; font-weight: 800; margin: 0; line-height: 1.1;
  #       background: linear-gradient(90deg, #00c6ff, #7b3fe4, #ff2975, #ff8d3f); 
  #       -webkit-background-clip: text; 
  #       -webkit-text-fill-color: transparent; 
  #       background-clip: text;
  #       text-fill-color: transparent;
  #       display: inline-block;
  #       text-shadow: 0 0 15px rgba(0, 198, 255, 0.5), 0 0 25px rgba(123, 63, 228, 0.3), 0 0 35px rgba(255, 41, 117, 0.3), 0 0 45px rgba(255, 141, 63, 0.3);",
  #   class = "main-title",
  #   "GEwend"
  # ),),
  div(id = "central-subtitle", "Future-Proof Actuarial Intelligence"),
  # div(h3(
  #   style = "color: white; font-size: 32px; font-weight: 300; margin: 15px 0 0 0;",
  #   class = "subtitle",
  #   "Future-Proof Actuarial Intelligence"
  # )),
  
  
  
  # Navigation bar
  navbarPage(
    title = div(
      img(id = "logo", src = "https://placeholder.pics/svg/150x40/000814-0cf/FFFFFF/ANALYTCUBES", alt = "ANALYTCUBES")
    ),
    id = "navbar",
    windowTitle = "AnalytCubes - Future-Proof Actuarial Analytics",
    tabPanel("Home", value = "home"),
    tabPanel("Solutions", value = "solutions"),
    tabPanel("Products", value = "products"),
    tabPanel("About", value = "about"),
    header = div(class = "navbar-right", actionButton("contactBtn", "CONNECT", class = "btn")),
    
    # Content (empty)
    tabPanelBody("home",
                 div(class = "content")
    )
  ),
  
  
  tags$script(HTML('
    document.addEventListener("DOMContentLoaded", function() {
      const container = document.getElementById("canvas-container");
      const canvas = document.createElement("canvas");
      container.appendChild(canvas);
      const ctx = canvas.getContext("2d");

      let width = window.innerWidth;
      let height = window.innerHeight;
      canvas.width = width;
      canvas.height = height;

      let mouse = { x: undefined, y: undefined, radius: 180 };
      let lastMouseX = width / 2;
      let lastMouseY = height / 2;
      let mouseVelocityX = 0;
      let mouseVelocityY = 0;

      window.addEventListener("mousemove", function(event) {
        mouseVelocityX = event.clientX - lastMouseX;
        mouseVelocityY = event.clientY - lastMouseY;
        lastMouseX = mouse.x = event.clientX;
        lastMouseY = mouse.y = event.clientY;
      });

      window.addEventListener("resize", function() {
        width = window.innerWidth;
        height = window.innerHeight;
        canvas.width = width;
        canvas.height = height;
        init();
      });

      const symbols = [
        "∑", "∫", "π", "√", "∞", "µ", "σ", "λ", "∂", "∝", "Ω", "Φ", "¹", "²", "³", "%", "$", "€", "£", "#", "A", "x", "y", "z", "+", "-", "*", "/", "=", "<", ">", "!", "?"
      ];
      const colors = [ "#00ccff", "#00eeff", "#64f0ff", "#0cf", "#0ff", "#0077cc", "#99ccff","#ff69b4", "#ff1493", "#da70d6", "#ba55d3", "#9400d3", "#8a2be2", "#00ffff", "#7fffd4", "#66cdaa", "#20b2aa", "#008080", "#006400","#ffa500", "#ff8c00", "#ff4500","#ffff00"]; // Array of colors

      class Symbol {
        constructor(x, y, size) {
          this.x = x;
          this.y = y;
          this.z = Math.random() * 400 - 200;
          this.size = size;
          this.baseSize = (Math.random() * 30) + 10; // Randomized size
          this.velocity = { x: (Math.random() - 0.5) * 1.5, y: (Math.random() - 0.5) * 1.5, z: (Math.random() - 0.5) * 1 };
          this.opacity = 0.2 + Math.random() * 0.2;
          this.baseSize = size * 2; // Increased base size
          this.symbol = symbols[Math.floor(Math.random() * symbols.length)];
          this.color = colors[Math.floor(Math.random() * colors.length)]; // Assign random color
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
        ctx.fillStyle = this.color; // Use the assigned color
        ctx.font = (this.baseSize * 0.8) + "px Inter"; // Larger font size
        ctx.textAlign = "center";
        ctx.textBaseline = "middle";
        ctx.fillText(this.symbol, 0, 0);
        ctx.restore();
          ctx.fillText(this.symbol, 0, 0); // Use the assigned symbol
        }

        calculateDistance(symbol) {
          const dx = this.x - symbol.x;
          const dy = this.y - symbol.y;
          const dz = this.z - symbol.z;
          return Math.sqrt(dx * dx + dy * dy + dz * dz);
        }
      }

      let symbolsArray = [];

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
        const maxConnections = 500;  // Limit connections for performance
        let drawnConnections = 0;

        symbolsArray.sort((a, b) => b.z - a.z); // Sort for proper layering

        for (let i = 0; i < symbolsArray.length && drawnConnections < maxConnections; i++) {
          for (let j = i + 1; j < symbolsArray.length && drawnConnections < maxConnections; j++) {
            const distance = symbolsArray[i].calculateDistance(symbolsArray[j]);
            if (distance < connectionDistance) {
              const opacity = Math.max(0.2, 0.5 * (1 - distance / connectionDistance));
              ctx.strokeStyle = "rgba(225, 225, 225, " + opacity + ")"; // Connection color
              ctx.lineWidth = 1; // Connection line width
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
        ctx.fillStyle = "#000814"; // Background color
        ctx.fillRect(0, 0, width, height);

        symbolsArray.forEach(symbol => {
          symbol.update();
        });

        drawConnections();
      }

      init();
      animate();
    });
  '))
)

server <- function(input, output, session) { 
  #test
  #test2
  #test3
  
  }

shinyApp(ui = ui, server = server)
