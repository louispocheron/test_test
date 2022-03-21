<?php

namespace App\Repository;

use App\Entity\Action;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Action|null find($id, $lockMode = null, $lockVersion = null)
 * @method Action|null findOneBy(array $criteria, array $orderBy = null)
 * @method Action[]    findAll()
 * @method Action[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ActionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Action::class);
    }

    // /**
    //  * @return Action[] Returns an array of Action objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    public function findByUsers($user){
        return $this->createQueryBuilder('action')
            ->andWhere('action.user = :user')
            ->setParameter('user', $user->getId())
            ->getQuery()
            ->getResult()
        ;
    }


    public function findByAssociation($association){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->setParameter('association', $association->getId())
            ->getQuery()
            ->getResult()
        ;
    }

    public function findLatestAction($user){
        return $this->createQueryBuilder('action')
            ->andWhere('action.user = :user')
            ->setParameter('user', $user->getId())
            ->orderBy('action.id', 'DESC')
            ->setMaxResults(1)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByAssociationAndUser($association, $user){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->andWhere('action.user = :user')
            ->setParameter('association', $association->getId())
            ->setParameter('user', $user->getId())
            ->getQuery()
            ->getResult()
        ;
    }

    // public function findActionFromThisYear($user){
    //     return $this->createQueryBuilder('action')
    //         ->andWhere('action.user = :user')
    //         ->andWhere('action.date >= :date')
    //         ->setParameter('user', $user->getId())
    //         ->setParameter('date', date('Y-01-01'))
    //         ->getQuery()
    //         ->getResult()
    //     ;
    // }

    public function findByAssociationAndUserThisYear($association, $user){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->andWhere('action.user = :user')
            ->andWhere('action.date >= :date')
            ->setParameter('association', $association->getId())
            ->setParameter('user', $user->getId())
            ->setParameter('date', date('Y-01-01'))
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByAssociationAndUserThisMonth($association, $user){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->andWhere('action.user = :user')
            ->andWhere('action.date >= :date')
            ->setParameter('association', $association->getId())
            ->setParameter('user', $user->getId())
            ->setParameter('date', date('Y-m-01'))
            ->getQuery()
            ->getResult()
        ;
    }
    public function findByAssociationAndUserByMonth($association, $user, $month){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->andWhere('action.user = :user')
            ->andWhere('action.date >= :date')
            ->setParameter('association', $association->getId())
            ->setParameter('user', $user->getId())
            ->setParameter('date', date('Y-'.$month.'-01'))
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByAssociationAndUserByMonthAndYear($association, $user, $month, $year){
        return $this->createQueryBuilder('action')
            ->andWhere('action.association = :association')
            ->andWhere('action.user = :user')
            ->andWhere('action.date >= :date')
            ->setParameter('association', $association->getId())
            ->setParameter('user', $user->getId())
            ->setParameter('date', date('Y-'.$month.'-01', strtotime($year)))
            ->getQuery()
            ->getResult()
        ;
    }

    
    /*
    public function findOneBySomeField($value): ?Action
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
