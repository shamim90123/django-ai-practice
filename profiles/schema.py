import graphene
from graphene_django.types import DjangoObjectType
from .models import Student


# Create a GraphQL type for the Student model
class StudentType(DjangoObjectType):
    class Meta:
        model = Student
        fields = ("first_name", "email")

# Define Queries
class Query(graphene.ObjectType):
    hello = graphene.String(default_value="Hello, World!")  # Add the hello field
    
    students = graphene.List(StudentType)
    student = graphene.Field(StudentType, id=graphene.Int())

    def resolve_students(self, info, **kwargs):
        return Student.objects.all()

    def resolve_student(self, info, id):
        try:
            return Student.objects.get(id=id)
        except Student.DoesNotExist:
            return None

# Define the Schema
schema = graphene.Schema(query=Query)
