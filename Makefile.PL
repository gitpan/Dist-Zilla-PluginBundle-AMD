
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Build your distributions like AMD does",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-PluginBundle-AMD",
  "EXE_FILES" => [],
  "LICENSE" => "open_source",
  "NAME" => "Dist::Zilla::PluginBundle::AMD",
  "PREREQ_PM" => {
    "Method::Signatures::Simple" => 0,
    "Moose" => "1.00",
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::Types::Email" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Structured" => "0.20",
    "MooseX::Types::URI" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



