import 'package:flutter/material.dart';

class Category {
  final String category;
  final Icon icon; // Icon veri tipi olarak değiştirildi
  final String label;

  Category({required this.category, required this.icon, required this.label});

  static List<Category> categories = [
    Category(
      category: "General",
      icon: Icon(Icons.gesture), // Icon widget'ı olarak verildi
      label: "Genel",
    ),
    Category(
      category: "Stress and anxiety",
      icon: Icon(Icons.pets),
      label: "Stres ve kaygi",
    ),
    Category(
      category: "Finding love",
      icon: Icon(Icons.favorite),
      label: "Aski bulmak",
    ),
    Category(
      category: "Personal development",
      icon: Icon(Icons.nature),
      label: "Kisisel gelisim",
    ),
    Category(
      category: "Positive thinking",
      icon: Icon(Icons.airplanemode_active),
      label: "Pozitif dusunmek",
    ),
    Category(
      category: "Body affirmation",
      icon: Icon(Icons.accessibility),
      label: "Beden olumlama",
    ),
    Category(
      category: "Tough days",
      icon: Icon(Icons.cloud),
      label: "Zor gunler",
    ),
    Category(
      category: "Self-confidence",
      icon: Icon(Icons.brightness_high),
      label: "Oz guven",
    ),
    Category(category: "Happiness", icon: Icon(Icons.sunny), label: "Mutluluk"),
    Category(
      category: "Work success",
      icon: Icon(Icons.work),
      label: "Is basarisi",
    ),
    Category(category: "Calmness", icon: Icon(Icons.spa), label: "Sakinlik"),
    Category(
      category: "Gratitude",
      icon: Icon(Icons.handshake),
      label: "Sukran",
    ),
    Category(
      category: "Health",
      icon: Icon(Icons.health_and_safety),
      label: "Saglik",
    ),
    Category(
      category: "Love yourself",
      icon: Icon(Icons.favorite_border),
      label: "Kendini sev",
    ),
  ];
}
