-- Script para Car Dealership Tycoon com tokens infinitos
local tokens = 1000000
local carros = {}

local function adicionarTokens(quantidade)
    tokens = tokens + quantidade
    print("Tokens adicionados: " .. quantidade)
end

local function comprarCarro(preco, nome)
    if tokens >= preco then
        tokens = tokens - preco
        table.insert(carros, nome)
        print("Carro comprado: " .. nome)
    else
        print("Tokens insuficientes")
    end
end

local function venderCarro(nome, preco)
    for i, carro in ipairs(carros) do
        if carro == nome then
            table.remove(carros, i)
            tokens = tokens + preco
            print("Carro vendido: " .. nome)
            return
        end
    end
    print("Carro não encontrado")
end

adicionarTokens(1000)
comprarCarro(500, "Ferrari")
venderCarro("Ferrari", 600)
print("Tokens atuais: " .. tokens)
