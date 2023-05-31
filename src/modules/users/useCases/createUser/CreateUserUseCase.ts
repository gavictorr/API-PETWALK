import { User } from "@prisma/client";
import { PrismaClientUnknownRequestError } from "@prisma/client/runtime";
import { prisma } from "../../../../prisma/client";
import { CreateUserDTO } from "../../dtos/CreateUserDTO";

export class CreateUserUseCase {
    async execute({name, email}: CreateUserDTO): Promise<User>{
        // Verificar se o usuario ja existe
        const UsuarioJaExiste = await prisma.user.findUnique({
            where: {
                email
            }
        });
        if (UsuarioJaExiste){
            //Erro

        };

        //Criar Usuario
        const user = await prisma.user.create({
            data: {
                name,
                email,
            },
        });

        return user;
    }
}