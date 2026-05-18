/*Este modelo representa la información exactamente como viene en la respuesta 
JSON */
class ListaResponseDto {
  final int id;
  final int usuarioId;
  final String titulo;
  final int orden;
  final int createdAt;
  final int updatedAt;

  ListaResponseDto({
    required this.id,
    required this.usuarioId,
    required this.titulo,
    required this.orden,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListaResponseDto.fromJson(Map<String, dynamic> json) =>
      ListaResponseDto(
        id: json["id"],
        usuarioId: json["usuario_id"],
        titulo: json["titulo"],
        orden: json["orden"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "usuario_id": usuarioId,
    "titulo": titulo,
    "orden": orden,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  @override
  String toString() {
    return 'ListaResponseDto(id: $id, usuarioId: $usuarioId, titulo: "$titulo", orden: $orden, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
