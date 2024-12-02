import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["canvas"]; // Déclarer la cible du canvas

  connect() {
    // Configuration initiale
    this.canvas = this.canvasTarget;
    this.ctx = this.canvas.getContext("2d");

    // Adapter la taille du canvas
    this.resizeCanvas();
    window.addEventListener("resize", this.resizeCanvas.bind(this));

    // Grille de points
    this.pointSize = 1;
    this.spacing = 15;
    this.animationSpeed = 0.1;
    this.points = this.initializePoints();

    // Commencer l'animation
    this.mouseX = -999;
    this.mouseY = -999;
    this.animate();
  }

  disconnect() {
    // Nettoyer les écouteurs d'événements
    window.removeEventListener("resize", this.resizeCanvas);
  }

  // Gestion de la taille du canvas
  resizeCanvas() {
    this.canvas.width = window.innerWidth;
    this.canvas.height = window.innerHeight;
    this.points = this.initializePoints(); // Recalculez la grille si la fenêtre change
  }

  // Initialisation de la grille de points
  initializePoints() {
    const points = [];
    for (let x = 0; x < this.canvas.width; x += this.spacing) {
      for (let y = 0; y < this.canvas.height; y += this.spacing) {
        points.push({ x, y, currentOpacity: 0.3, targetOpacity: 0.3 });
      }
    }
    return points;
  }

  // Animation continue
  animate() {
    this.drawPoints();
    requestAnimationFrame(() => this.animate());
  }

  // Dessiner les points
  drawPoints() {
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

    this.points.forEach((point) => {
      const distance = Math.hypot(point.x - this.mouseX, point.y - this.mouseY);
      const maxDistance = 100;

      // Définir l'opacité cible
      if (distance < maxDistance) {
        point.targetOpacity = 0.8 - (distance / maxDistance) * 0.5;
      } else {
        point.targetOpacity = 0.15;
      }

      // Interpoler vers l'opacité cible
      point.currentOpacity +=
        (point.targetOpacity - point.currentOpacity) * this.animationSpeed;

      // Dessiner le point
      this.ctx.beginPath();
      this.ctx.arc(point.x, point.y, this.pointSize, 0, Math.PI * 2);
      this.ctx.fillStyle = `rgba(244, 196, 243, ${point.currentOpacity})`;
      this.ctx.fill();
    });
  }

  // Suivre les mouvements de la souris
  onMouseMove(event) {
    this.mouseX = event.clientX;
    this.mouseY = event.clientY;
  }
}
